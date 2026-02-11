USE [OnlineShop];
GO

-- Expand home page featured items
IF OBJECT_ID('dbo.ITEM_SELECT_TOP4', 'P') IS NOT NULL
BEGIN
    EXEC('
    ALTER PROCEDURE dbo.ITEM_SELECT_TOP4
    AS
    BEGIN
        SET NOCOUNT ON;
        SELECT TOP 16 IID, IName, Detail, Price, Image, Qnt, AQnt, SQnt, CName, EntryDate, Image1, Image2, Size
        FROM dbo.ITEMMST
        ORDER BY IID DESC;
        RETURN 0;
    END
    ');
END
GO

-- Add extra sample products (skip if already inserted)
IF NOT EXISTS (SELECT 1 FROM dbo.ITEMMST WHERE IName = 'Cloud Pace')
BEGIN
    INSERT INTO dbo.ITEMMST (IName, Detail, Price, Image, Qnt, AQnt, SQnt, CName, EntryDate, Image1, Image2, Size) VALUES
    ('Cloud Pace', 'Soft foam midsole for daily runs', 64.00, '~/img/i2.jpg', 22, 22, 0, 'Men', GETDATE(), '~/img/i3.jpg', '~/img/i4.jpg', 9),
    ('Trail Forge', 'Grippy outsole for rugged paths', 88.00, '~/img/i5.jpg', 14, 14, 0, 'Men', GETDATE(), '~/img/i1.jpg', '~/img/i2.jpg', 10),
    ('Velvet Step', 'Sleek leather finish', 96.50, '~/img/s2.jpg', 9, 9, 0, 'Women', GETDATE(), '~/img/s3.jpg', '~/img/s4.jpg', 7),
    ('Studio Flow', 'Flexible shoe for studio workouts', 58.00, '~/img/s5.jpg', 16, 16, 0, 'Women', GETDATE(), '~/img/s1.jpg', '~/img/s2.jpg', 6),
    ('Mini Trek', 'Rugged build for playtime', 42.00, '~/img/n2.jpg', 20, 20, 0, 'Kids', GETDATE(), '~/img/n3.jpg', '~/img/n4.jpg', 4),
    ('Comet Junior', 'Lightweight shoe for school', 36.50, '~/img/n5.jpg', 24, 24, 0, 'Kids', GETDATE(), '~/img/n1.jpg', '~/img/n2.jpg', 5),
    ('Sprint Elite', 'Performance cushion with stability', 92.00, '~/img/c1.jpg', 11, 11, 0, 'Sports', GETDATE(), '~/img/c2.jpg', '~/img/c3.jpg', 10),
    ('Velocity Pro', 'Breathable race day fit', 110.00, '~/img/c2.jpg', 8, 8, 0, 'Sports', GETDATE(), '~/img/c3.jpg', '~/img/c1.jpg', 11);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.ITEMMST WHERE IName = 'Luna Step')
BEGIN
    INSERT INTO dbo.ITEMMST (IName, Detail, Price, Image, Qnt, AQnt, SQnt, CName, EntryDate, Image1, Image2, Size) VALUES
    ('Luna Step', 'All-day comfort with a clean silhouette', 74.00, '~/img/s3.jpg', 18, 18, 0, 'Women', GETDATE(), '~/img/s4.jpg', '~/img/s5.jpg', 8),
    ('Metro Glide', 'City-ready sneaker with soft lining', 82.00, '~/img/i4.jpg', 15, 15, 0, 'Men', GETDATE(), '~/img/i5.jpg', '~/img/i2.jpg', 9),
    ('Nimbus Lite', 'Lightweight mesh upper', 68.00, '~/img/i3.jpg', 20, 20, 0, 'Men', GETDATE(), '~/img/i1.jpg', '~/img/i2.jpg', 10),
    ('Coastal Ease', 'Slip-on comfort for weekends', 54.00, '~/img/s1.jpg', 12, 12, 0, 'Women', GETDATE(), '~/img/s2.jpg', '~/img/s3.jpg', 7),
    ('Spark Runner', 'Playful style for kids', 38.00, '~/img/n3.jpg', 22, 22, 0, 'Kids', GETDATE(), '~/img/n4.jpg', '~/img/n5.jpg', 4),
    ('Pebble Trek', 'Durable grip for all-day wear', 98.00, '~/img/i5.jpg', 10, 10, 0, 'Men', GETDATE(), '~/img/i4.jpg', '~/img/i3.jpg', 11),
    ('Court Pulse', 'Responsive training shoe', 86.00, '~/img/c3.jpg', 13, 13, 0, 'Sports', GETDATE(), '~/img/c2.jpg', '~/img/c1.jpg', 10),
    ('Classic Crest', 'Polished finish for formal wear', 120.00, '~/img/i2.jpg', 9, 9, 0, 'Men', GETDATE(), '~/img/i1.jpg', '~/img/i3.jpg', 9);
END
GO
