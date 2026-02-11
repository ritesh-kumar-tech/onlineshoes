// script.js - Enhanced E-Commerce Functionality

// ==================== THEME TOGGLE ====================
const themeToggle = document.getElementById('themeToggle');
if (themeToggle) {
  const currentTheme = localStorage.getItem('theme') || 'light';
  document.body.classList.toggle('dark', currentTheme === 'dark');
  themeToggle.textContent = currentTheme === 'dark' ? '☀️' : '🌙';

  themeToggle.addEventListener('click', () => {
    const isDark = document.body.classList.toggle('dark');
    localStorage.setItem('theme', isDark ? 'dark' : 'light');
    themeToggle.textContent = isDark ? '☀️' : '🌙';
  });
}

// ==================== CART FUNCTIONALITY ====================
let cart = JSON.parse(localStorage.getItem('cart')) || [];

function updateCartCount() {
  const cartCountElements = document.querySelectorAll('.cart-count');
  const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
  cartCountElements.forEach(el => {
    el.textContent = totalItems;
  });
}

function addToCart(productName, price) {
  const existingItem = cart.find(item => item.name === productName);
  if (existingItem) {
    existingItem.quantity += 1;
  } else {
    cart.push({ name: productName, price: price, quantity: 1 });
  }
  localStorage.setItem('cart', JSON.stringify(cart));
  updateCartCount();
  showNotification(`${productName} added to cart!`);
}

// Initialize cart count on page load
updateCartCount();

// ==================== NOTIFICATION SYSTEM ====================
function showNotification(message, type = 'success') {
  // Remove existing notification
  const existingNotification = document.querySelector('.notification');
  if (existingNotification) {
    existingNotification.remove();
  }

  const notification = document.createElement('div');
  notification.className = `notification notification-${type}`;
  notification.innerHTML = `
    <span>${message}</span>
    <button onclick="this.parentElement.remove()">×</button>
  `;
  notification.style.cssText = `
    position: fixed;
    top: 100px;
    right: 20px;
    background: ${type === 'success' ? '#27ae60' : '#e74c3c'};
    color: white;
    padding: 1rem 1.5rem;
    border-radius: 8px;
    display: flex;
    align-items: center;
    gap: 1rem;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    z-index: 10000;
    animation: slideIn 0.3s ease;
  `;

  // Add animation keyframes
  if (!document.querySelector('#notification-styles')) {
    const style = document.createElement('style');
    style.id = 'notification-styles';
    style.textContent = `
      @keyframes slideIn {
        from { transform: translateX(100%); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
      }
      @keyframes slideOut {
        from { transform: translateX(0); opacity: 1; }
        to { transform: translateX(100%); opacity: 0; }
      }
    `;
    document.head.appendChild(style);
  }

  document.body.appendChild(notification);

  // Auto remove after 3 seconds
  setTimeout(() => {
    notification.style.animation = 'slideOut 0.3s ease forwards';
    setTimeout(() => notification.remove(), 300);
  }, 3000);
}

// ==================== ADD TO CART BUTTONS ====================
document.querySelectorAll('.add-to-cart-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const card = btn.closest('.product-card');
    const productName = card.querySelector('h3')?.innerText || 'Item';
    const priceText = card.querySelector('.current-price')?.innerText || '$0';
    const price = parseFloat(priceText.replace('$', ''));
    addToCart(productName, price);
  });
});

// ==================== WISHLIST FUNCTIONALITY ====================
let wishlist = JSON.parse(localStorage.getItem('wishlist')) || [];

document.querySelectorAll('.action-btn.wishlist').forEach(btn => {
  btn.addEventListener('click', (e) => {
    e.stopPropagation();
    const card = btn.closest('.product-card');
    const productName = card.querySelector('h3')?.innerText || 'Item';

    if (wishlist.includes(productName)) {
      wishlist = wishlist.filter(item => item !== productName);
      btn.textContent = '♡';
      showNotification(`${productName} removed from wishlist`, 'error');
    } else {
      wishlist.push(productName);
      btn.textContent = '❤️';
      showNotification(`${productName} added to wishlist!`);
    }
    localStorage.setItem('wishlist', JSON.stringify(wishlist));
  });

  // Check if already in wishlist
  const card = btn.closest('.product-card');
  const productName = card.querySelector('h3')?.innerText || 'Item';
  if (wishlist.includes(productName)) {
    btn.textContent = '❤️';
  }
});

// ==================== PRODUCT SEARCH ====================
const searchInput = document.getElementById('searchInput');
const headerSearch = document.getElementById('headerSearch');

function filterProducts(term) {
  const searchTerm = term.toLowerCase();
  document.querySelectorAll('.product-card').forEach(card => {
    const name = card.dataset.name?.toLowerCase() || '';
    const category = card.dataset.category?.toLowerCase() || '';
    const titleText = card.querySelector('h3')?.innerText.toLowerCase() || '';
    const matches = name.includes(searchTerm) || category.includes(searchTerm) || titleText.includes(searchTerm);
    card.style.display = matches ? '' : 'none';
  });
}

if (searchInput) {
  searchInput.addEventListener('input', () => filterProducts(searchInput.value));
}

if (headerSearch) {
  headerSearch.addEventListener('input', () => filterProducts(headerSearch.value));
  headerSearch.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      // Redirect to product page with search query
      window.location.href = `product.html?search=${encodeURIComponent(headerSearch.value)}`;
    }
  });
}

// Handle search query from URL
const urlParams = new URLSearchParams(window.location.search);
const searchQuery = urlParams.get('search');
if (searchQuery) {
  if (searchInput) {
    searchInput.value = searchQuery;
    filterProducts(searchQuery);
  }
}

// ==================== QUICK VIEW MODAL ====================
document.querySelectorAll('.action-btn.quick-view').forEach(btn => {
  btn.addEventListener('click', (e) => {
    e.stopPropagation();
    const card = btn.closest('.product-card');
    const productName = card.querySelector('h3')?.innerText || 'Product';
    const category = card.querySelector('.product-category')?.innerText || '';
    const price = card.querySelector('.current-price')?.innerText || '';
    const rating = card.querySelector('.product-rating')?.innerText || '';
    const imgSrc = card.querySelector('.product-image img')?.src || '';

    // Create modal
    const modal = document.createElement('div');
    modal.className = 'quick-view-modal';
    modal.innerHTML = `
      <div class="modal-backdrop"></div>
      <div class="modal-content">
        <button class="modal-close">×</button>
        <div class="modal-body">
          <div class="modal-image">
            <img src="${imgSrc}" alt="${productName}" />
          </div>
          <div class="modal-info">
            <span class="modal-category">${category}</span>
            <h2>${productName}</h2>
            <div class="modal-rating">${rating}</div>
            <div class="modal-price">${price}</div>
            <p class="modal-description">Premium quality footwear designed for comfort and style. Made with high-quality materials for durability and all-day wear.</p>
            <div class="modal-sizes">
              <span>Size:</span>
              <div class="size-options">
                <button class="size-btn">7</button>
                <button class="size-btn">8</button>
                <button class="size-btn active">9</button>
                <button class="size-btn">10</button>
                <button class="size-btn">11</button>
              </div>
            </div>
            <button class="btn btn-primary modal-add-cart">Add to Cart</button>
          </div>
        </div>
      </div>
    `;

    modal.style.cssText = `
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: 10000;
      display: flex;
      align-items: center;
      justify-content: center;
    `;

    // Add modal styles
    if (!document.querySelector('#modal-styles')) {
      const style = document.createElement('style');
      style.id = 'modal-styles';
      style.textContent = `
        .modal-backdrop {
          position: absolute;
          inset: 0;
          background: rgba(0, 0, 0, 0.6);
          backdrop-filter: blur(5px);
        }
        .modal-content {
          position: relative;
          background: var(--color-card, #fff);
          border-radius: 16px;
          max-width: 800px;
          width: 90%;
          max-height: 90vh;
          overflow: auto;
          box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
          animation: modalIn 0.3s ease;
        }
        @keyframes modalIn {
          from { transform: scale(0.9); opacity: 0; }
          to { transform: scale(1); opacity: 1; }
        }
        .modal-close {
          position: absolute;
          top: 1rem;
          right: 1rem;
          background: none;
          border: none;
          font-size: 2rem;
          cursor: pointer;
          color: var(--color-text, #333);
          z-index: 10;
        }
        .modal-body {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 2rem;
          padding: 2rem;
        }
        .modal-image img {
          width: 100%;
          border-radius: 12px;
        }
        .modal-category {
          font-size: 0.8rem;
          color: var(--color-text-light, #777);
          letter-spacing: 1px;
        }
        .modal-info h2 {
          font-size: 1.8rem;
          margin: 0.5rem 0;
          color: var(--color-text, #333);
        }
        .modal-rating {
          margin-bottom: 1rem;
        }
        .modal-price {
          font-size: 1.5rem;
          font-weight: 700;
          color: var(--color-primary, #1a5f7a);
          margin-bottom: 1rem;
        }
        .modal-description {
          color: var(--color-text-light, #777);
          margin-bottom: 1.5rem;
          line-height: 1.6;
        }
        .modal-sizes {
          margin-bottom: 1.5rem;
        }
        .modal-sizes span {
          display: block;
          margin-bottom: 0.5rem;
          font-weight: 600;
        }
        .size-options {
          display: flex;
          gap: 0.5rem;
        }
        .size-btn {
          width: 40px;
          height: 40px;
          border: 1px solid var(--color-border, #ddd);
          background: var(--color-bg, #fff);
          border-radius: 8px;
          cursor: pointer;
          transition: 0.2s;
        }
        .size-btn:hover, .size-btn.active {
          background: var(--color-primary, #1a5f7a);
          color: white;
          border-color: var(--color-primary, #1a5f7a);
        }
        .modal-add-cart {
          width: 100%;
        }
        @media (max-width: 768px) {
          .modal-body {
            grid-template-columns: 1fr;
          }
        }
      `;
      document.head.appendChild(style);
    }

    document.body.appendChild(modal);
    document.body.style.overflow = 'hidden';

    // Close modal events
    modal.querySelector('.modal-close').addEventListener('click', () => {
      modal.remove();
      document.body.style.overflow = '';
    });
    modal.querySelector('.modal-backdrop').addEventListener('click', () => {
      modal.remove();
      document.body.style.overflow = '';
    });
    modal.querySelector('.modal-add-cart').addEventListener('click', () => {
      addToCart(productName, parseFloat(price.replace('$', '')));
      modal.remove();
      document.body.style.overflow = '';
    });

    // Size selection
    modal.querySelectorAll('.size-btn').forEach(sizeBtn => {
      sizeBtn.addEventListener('click', () => {
        modal.querySelectorAll('.size-btn').forEach(b => b.classList.remove('active'));
        sizeBtn.classList.add('active');
      });
    });
  });
});

// ==================== SMOOTH SCROLL ====================
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    e.preventDefault();
    const target = document.querySelector(this.getAttribute('href'));
    if (target) {
      target.scrollIntoView({ behavior: 'smooth' });
    }
  });
});

// ==================== HEADER SCROLL EFFECT ====================
let lastScroll = 0;
const header = document.querySelector('.site-header');

window.addEventListener('scroll', () => {
  const currentScroll = window.pageYOffset;

  if (currentScroll > 100) {
    header?.classList.add('scrolled');
  } else {
    header?.classList.remove('scrolled');
  }

  lastScroll = currentScroll;
});

// Add scrolled header styles
if (!document.querySelector('#header-scroll-styles')) {
  const style = document.createElement('style');
  style.id = 'header-scroll-styles';
  style.textContent = `
    .site-header.scrolled {
      box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
    }
  `;
  document.head.appendChild(style);
}

// ==================== NEWSLETTER SUBSCRIPTION ====================
const promoForm = document.querySelector('.promo-form');
if (promoForm) {
  promoForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const email = promoForm.querySelector('input').value;
    if (email) {
      showNotification('Thank you for subscribing! Check your email for exclusive deals.');
      promoForm.querySelector('input').value = '';
    }
  });

  promoForm.querySelector('button')?.addEventListener('click', (e) => {
    e.preventDefault();
    const email = promoForm.querySelector('input').value;
    if (email) {
      showNotification('Thank you for subscribing! Check your email for exclusive deals.');
      promoForm.querySelector('input').value = '';
    }
  });
}

// ==================== LOGIN FORM ====================
const loginForm = document.getElementById('loginForm');
if (loginForm) {
  loginForm.addEventListener('submit', e => {
    e.preventDefault();
    const email = document.getElementById('email').value;
    showNotification(`Welcome back! Logged in as ${email}`);
    setTimeout(() => {
      window.location.href = 'index.html';
    }, 1500);
  });
}

// ==================== SIGNUP FORM ====================
const signupForm = document.getElementById('signupForm');
if (signupForm) {
  signupForm.addEventListener('submit', e => {
    e.preventDefault();
    const name = document.getElementById('name').value;
    const pwd = document.getElementById('password').value;
    const cpwd = document.getElementById('confirmPassword').value;

    if (pwd !== cpwd) {
      showNotification('Passwords do not match!', 'error');
      return;
    }

    if (pwd.length < 6) {
      showNotification('Password must be at least 6 characters!', 'error');
      return;
    }

    showNotification(`Welcome, ${name}! Your account has been created.`);
    setTimeout(() => {
      window.location.href = 'login.html';
    }, 1500);
  });
}

// ==================== LAZY LOADING IMAGES ====================
document.addEventListener('DOMContentLoaded', () => {
  const images = document.querySelectorAll('img');
  const imageObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const img = entry.target;
        img.style.opacity = '1';
        observer.unobserve(img);
      }
    });
  });

  images.forEach(img => {
    img.style.opacity = '0';
    img.style.transition = 'opacity 0.5s ease';
    imageObserver.observe(img);
  });
});

console.log('🛒 OnlineShoes E-Commerce - All systems loaded!');
