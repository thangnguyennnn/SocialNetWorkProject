USE [Social_Network]
GO
ALTER TABLE [dbo].[UserInformation] DROP CONSTRAINT [FK_UserInformation_Account]
GO
ALTER TABLE [dbo].[Post] DROP CONSTRAINT [FK_Post_Account1]
GO
ALTER TABLE [dbo].[Participant] DROP CONSTRAINT [FK_Participant_Conversation]
GO
ALTER TABLE [dbo].[Participant] DROP CONSTRAINT [FK_Participant_Account]
GO
ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK_Notification_Account]
GO
ALTER TABLE [dbo].[Like] DROP CONSTRAINT [FK_Like_Post]
GO
ALTER TABLE [dbo].[Dating] DROP CONSTRAINT [FK_Dating_UserInformation]
GO
ALTER TABLE [dbo].[Dating] DROP CONSTRAINT [FK_Dating_DatingProfile]
GO
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK_Comment_Post]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserInformation]') AND type in (N'U'))
DROP TABLE [dbo].[UserInformation]
GO
/****** Object:  Table [dbo].[Statistic]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statistic]') AND type in (N'U'))
DROP TABLE [dbo].[Statistic]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report]') AND type in (N'U'))
DROP TABLE [dbo].[Report]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Post]') AND type in (N'U'))
DROP TABLE [dbo].[Post]
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participant]') AND type in (N'U'))
DROP TABLE [dbo].[Participant]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notification]') AND type in (N'U'))
DROP TABLE [dbo].[Notification]
GO
/****** Object:  Table [dbo].[MessageContent]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MessageContent]') AND type in (N'U'))
DROP TABLE [dbo].[MessageContent]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Like]') AND type in (N'U'))
DROP TABLE [dbo].[Like]
GO
/****** Object:  Table [dbo].[DatingProfile]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DatingProfile]') AND type in (N'U'))
DROP TABLE [dbo].[DatingProfile]
GO
/****** Object:  Table [dbo].[Dating]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dating]') AND type in (N'U'))
DROP TABLE [dbo].[Dating]
GO
/****** Object:  Table [dbo].[Conversation]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Conversation]') AND type in (N'U'))
DROP TABLE [dbo].[Conversation]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
DROP TABLE [dbo].[Comment]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attachments]') AND type in (N'U'))
DROP TABLE [dbo].[Attachments]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 24/03/2022 11:52:11 SA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
DROP TABLE [dbo].[Account]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userID] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[status] [int] NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [nvarchar](50) NOT NULL,
	[attachmentURL] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentID] [nvarchar](10) NOT NULL,
	[postID] [nvarchar](10) NOT NULL,
	[userID] [nvarchar](10) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
	[time] [nvarchar](30) NULL,
	[status] [int] NULL,
	[commented_time] [nvarchar](50) NULL,
	[sttCmt] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversation]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversation](
	[conversationID] [nvarchar](30) NOT NULL,
	[imageFile] [nvarchar](max) NULL,
	[statusForU1] [int] NULL,
	[statusForU2] [nchar](10) NULL,
 CONSTRAINT [PK_Conversation] PRIMARY KEY CLUSTERED 
(
	[conversationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dating]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dating](
	[datingID] [nvarchar](10) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[targetID] [nvarchar](50) NULL,
	[isLike] [bit] NULL,
 CONSTRAINT [PK_Dating] PRIMARY KEY CLUSTERED 
(
	[datingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatingProfile]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatingProfile](
	[userID] [nvarchar](50) NOT NULL,
	[nickName] [nvarchar](50) NULL,
	[location] [nvarchar](max) NULL,
	[isHaveChild] [nvarchar](30) NULL,
	[gender] [nvarchar](30) NULL,
	[detail] [nvarchar](max) NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[image3] [nvarchar](max) NULL,
	[image4] [nvarchar](max) NULL,
	[image5] [nvarchar](max) NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_DatingProfile] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[likeID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [nvarchar](10) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[likeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageContent]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageContent](
	[ConversationID] [nvarchar](30) NOT NULL,
	[senderID] [nvarchar](50) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[time] [varchar](50) NULL,
	[sttMessage] [int] NULL,
	[type] [int] NULL,
	[status1] [int] NULL,
	[status2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notificationID] [nvarchar](50) NOT NULL,
	[receiverID] [nvarchar](50) NULL,
	[delivererID] [nvarchar](50) NULL,
	[message] [nvarchar](max) NULL,
	[link] [nvarchar](max) NULL,
	[icon] [nvarchar](50) NULL,
	[status] [int] NULL,
	[date] [nvarchar](50) NULL,
	[stt] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[notificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participant](
	[participantID] [nvarchar](30) NOT NULL,
	[userID1] [nvarchar](50) NULL,
	[userID2] [nvarchar](50) NULL,
	[status] [nvarchar](10) NULL,
	[conversationID] [nvarchar](30) NULL,
 CONSTRAINT [PK_Participant] PRIMARY KEY CLUSTERED 
(
	[participantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[postID] [nvarchar](10) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[detail] [nvarchar](max) NULL,
	[imageFile] [nvarchar](max) NULL,
	[videoLink] [nvarchar](max) NULL,
	[status] [int] NULL,
	[posted_time] [nvarchar](50) NULL,
	[sttPost] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[reportID] [nvarchar](50) NOT NULL,
	[postID] [nvarchar](10) NULL,
	[accuser] [nvarchar](50) NULL,
	[accused] [nvarchar](50) NULL,
	[reason] [nvarchar](max) NULL,
	[message] [nvarchar](max) NULL,
	[link] [nvarchar](max) NULL,
	[status] [int] NULL,
	[date] [nvarchar](50) NULL,
	[stt] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistic]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistic](
	[StatisticID] [nvarchar](10) NOT NULL,
	[registerTurn] [int] NULL,
	[accessTurn] [int] NULL,
	[postTurn] [int] NULL,
	[commentTurn] [int] NULL,
	[likeTurn] [int] NULL,
	[date] [nvarchar](10) NULL,
 CONSTRAINT [PK_Statistic] PRIMARY KEY CLUSTERED 
(
	[StatisticID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 24/03/2022 11:52:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[userID] [nvarchar](50) NOT NULL,
	[avatar] [nvarchar](max) NULL,
	[background] [nvarchar](max) NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[middleName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[birthDate] [nvarchar](30) NULL,
	[sex] [nvarchar](30) NULL,
	[phone] [nvarchar](15) NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NULL,
	[education] [nvarchar](max) NULL,
	[job] [nvarchar](max) NULL,
	[hobbie] [nvarchar](max) NULL,
	[ortherInterest] [nvarchar](max) NULL,
	[imageFile] [nvarchar](max) NULL,
	[fbLink] [nvarchar](max) NULL,
	[instaLink] [nvarchar](max) NULL,
	[emailLink] [nvarchar](max) NULL,
	[tweetLink] [nvarchar](max) NULL,
	[createAt] [nchar](50) NULL,
 CONSTRAINT [PK_UserInformation] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([userID], [email], [password], [status], [isAdmin]) VALUES (N'1132200004', N'thangnhde150387@fpt.edu.vn', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1)
INSERT [dbo].[Account] ([userID], [email], [password], [status], [isAdmin]) VALUES (N'132200002', N'okbeyeu24@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 0)
INSERT [dbo].[Account] ([userID], [email], [password], [status], [isAdmin]) VALUES (N'1432200005', N'okbeyeu25@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 0)
INSERT [dbo].[Account] ([userID], [email], [password], [status], [isAdmin]) VALUES (N'1932200006', N'uyenthanh24@gmail.com', N'515DD75F9BD2B3E9ABB0867F838F12EF', 0, 0)
INSERT [dbo].[Account] ([userID], [email], [password], [status], [isAdmin]) VALUES (N'1932200007', N'chiengxongxoi@gmail.com', N'B253EA2F8C19978243431D6EB81C2385', 2, 0)
INSERT [dbo].[Account] ([userID], [email], [password], [status], [isAdmin]) VALUES (N'2332200008', N'dungvcde150071@fpt.edu.vn', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 0)
INSERT [dbo].[Account] ([userID], [email], [password], [status], [isAdmin]) VALUES (N'2822200000', N'thang24052001nguyen@gmail.com', N'BCD105D397C8A7C3D5413FFCFDBF99B8', 1, 1)
INSERT [dbo].[Account] ([userID], [email], [password], [status], [isAdmin]) VALUES (N'2822200001', N'huynhbaphu2001@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1)
INSERT [dbo].[Account] ([userID], [email], [password], [status], [isAdmin]) VALUES (N'332200003', N'lamquochung114x@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Attachments] ON 

INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (136, N'', N'Chú thích 2020-03-04 182822.png')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (139, N'P718358', N'IMG_20200227_152020.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (141, N'P357618', N'elephant-1822636_1920.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (151, N'P164197', N'Screenshot_2020-04-04-23-23-51-909_com.garena.game.kgvn.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (153, N'P164197', N'Screenshot_2020-04-09-11-31-49-574_com.garena.game.kgvn.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (156, N'P164197', N'Screenshot_2020-04-04-23-23-51-909_com.garena.game.kgvn.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (157, N'P375117', N'IMG_20200606_135144.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (158, N'P320251', N'avatar')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (160, N'P506298', N'background')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (161, N'P952935', N'avatar')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (162, N'P125815', N'01 (24).png')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (163, N'P576741', N'avatar')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (138, N'P382533', N'avatar')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (140, N'P539382', N'avatar')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (155, N'P164197', N'Screenshot_2020-04-09-10-31-45-218_com.gamehub.arb.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (137, N'P952968', N'Chú thích 2020-03-14 213456.png')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (142, N'P899886', N'avatar')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (152, N'P164197', N'Screenshot_2020-04-08-22-43-42-377_com.gamehub.arb.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (134, N'', N'InShot_20191221_225009021.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (135, N'', N'InShot_20191221_225009021.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (154, N'P164197', N'Screenshot_2020-04-22-12-25-31-015_com.gamehub.arb.jpg')
INSERT [dbo].[Attachments] ([ID], [postID], [attachmentURL]) VALUES (159, N'P909613', N'background')
SET IDENTITY_INSERT [dbo].[Attachments] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM1', N'P952968', N'2822200001', N'ghê', N'19/3/2022-19/41/31', NULL, NULL, 1)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM10', N'P952968', N'2822200001', N'hi', N'19/3/2022-19/52/15', NULL, NULL, 10)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM11', N'P952968', N'2822200001', N'lỗi cái lol', N'19/3/2022-19/55/31', NULL, NULL, 12)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM12', N'P952968', N'2822200001', N'f', N'19/3/2022-19/56/45', NULL, NULL, 13)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM13', N'P952968', N'2822200001', N'má', N'19/3/2022-20/3/21', NULL, NULL, 14)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM14', N'P952968', N'2822200001', N'được rồi nè clm chơi game', N'19/3/2022-20/3/46', NULL, NULL, 15)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM15', N'P952968', N'2822200000', N'haha', N'19/3/2022-20/16/45', NULL, NULL, 16)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM16', N'P952968', N'2822200001', N':v', N'19/3/2022-20/17/18', NULL, NULL, 17)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM18', N'P357618', N'2822200000', N'bày đặt', N'20/3/2022-14/2/41', NULL, NULL, 19)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM19', N'P357618', N'132200002', N'chém m giờ', N'20/3/2022-14/2/56', NULL, NULL, 20)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM192219', N'P576741', N'2332200008', N'halo', N'24/3/2022-10/32/36', NULL, NULL, 51)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM2', N'P952968', N'2822200001', N'ghê
', N'19/3/2022-19/41/33', NULL, NULL, 2)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM20', N'P357618', N'2822200000', N'vãi', N'20/3/2022-15/50/50', NULL, NULL, 21)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM21', N'P357618', N'2822200000', N'vãi
dfjhdsf', N'20/3/2022-15/51/4', NULL, NULL, 22)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM22', N'P718358', N'132200002', N'Quy Nhơn đẹp nhỉ', N'20/3/2022-16/2/40', NULL, NULL, 23)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM23', N'P718358', N'2822200001', N'Quy Nhơn đẹp quá', N'20/3/2022-16/3/7', NULL, NULL, 24)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM24', N'P718358', N'2822200000', N'Cảm ơn 2 bạn', N'20/3/2022-16/4/1', NULL, NULL, 25)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM25', N'P718358', N'132200002', N'haha', N'20/3/2022-16/4/10', NULL, NULL, 26)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM26', N'P357618', N'132200002', N'BỨc này đẹp chứ nhỉ', N'23/3/2022-7/43/7', NULL, NULL, 27)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM27', N'P718358', N'132200002', N'Thắng đã đến đây', N'23/3/2022-7/46/27', NULL, NULL, 28)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM28', N'P164197', N'2822200001', N'Được quá <#', N'23/3/2022-8/6/36', NULL, NULL, 29)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM29', N'P164197', N'132200002', N'Cảm ơn bajn', N'23/3/2022-8/8/37', NULL, NULL, 30)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM3', N'P748780', N'2822200001', N'd', N'19/3/2022-19/41/50', NULL, NULL, 3)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM30', N'P952935', N'2822200001', N'tym mạnh zô aeoiwi <3', N'23/3/2022-20/33/9', NULL, NULL, 31)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM31', N'P952968', N'2332200008', N'cái này khó kiếm lắm nè', N'23/3/2022-22/3/34', NULL, NULL, 32)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM32', N'P952968', N'2822200001', N'up lâu', N'23/3/2022-22/3/53', NULL, NULL, 33)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM33', N'P125815', N'2822200001', N'lag quá k thấy', N'23/3/2022-22/7/19', NULL, NULL, 34)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM34', N'P125815', N'2332200008', N'đợi xí đê', N'23/3/2022-22/7/32', NULL, NULL, 35)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM4', N'P748780', N'2822200001', N'd
', N'19/3/2022-19/41/51', NULL, NULL, 4)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM487154', N'P125815', N'2332200008', N'hehe', N'24/3/2022-10/40/50', NULL, NULL, 52)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM5', N'P748780', N'2822200001', N'd

', N'19/3/2022-19/41/51', NULL, NULL, 5)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM6', N'P748780', N'2822200001', N'd


', N'19/3/2022-19/41/51', NULL, NULL, 6)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM7', N'P748780', N'2822200001', N'd



', N'19/3/2022-19/41/52', NULL, NULL, 7)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM8', N'P748780', N'2822200001', N'd




', N'19/3/2022-19/41/52', NULL, NULL, 8)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM873200', N'P576741', N'2332200008', N'helo', N'24/3/2022-10/31/42', NULL, NULL, 50)
INSERT [dbo].[Comment] ([commentID], [postID], [userID], [detail], [time], [status], [commented_time], [sttCmt]) VALUES (N'CM9', N'P952968', N'2822200001', N'ghê', N'19/3/2022-19/42/11', NULL, NULL, 9)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C122569', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C231095', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C240327', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C301369', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C328884', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C339629', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C350082', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C362975', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C375942', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C513125', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C561557', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C562862', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C565127', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C585344', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C807939', N'', 1, N'1         ')
INSERT [dbo].[Conversation] ([conversationID], [imageFile], [statusForU1], [statusForU2]) VALUES (N'C982551', N'', 1, N'1         ')
GO
INSERT [dbo].[DatingProfile] ([userID], [nickName], [location], [isHaveChild], [gender], [detail], [image1], [image2], [image3], [image4], [image5], [active]) VALUES (N'1132200004', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 1)
INSERT [dbo].[DatingProfile] ([userID], [nickName], [location], [isHaveChild], [gender], [detail], [image1], [image2], [image3], [image4], [image5], [active]) VALUES (N'132200002', N'HT', N'Bình Định', N'Chưa có', N'Nữ', N'Oke', N'01 (29).png', N'01 (18).png', N'01 (10).png', N'', N'', 2)
INSERT [dbo].[DatingProfile] ([userID], [nickName], [location], [isHaveChild], [gender], [detail], [image1], [image2], [image3], [image4], [image5], [active]) VALUES (N'1432200005', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 1)
INSERT [dbo].[DatingProfile] ([userID], [nickName], [location], [isHaveChild], [gender], [detail], [image1], [image2], [image3], [image4], [image5], [active]) VALUES (N'1932200007', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 1)
INSERT [dbo].[DatingProfile] ([userID], [nickName], [location], [isHaveChild], [gender], [detail], [image1], [image2], [image3], [image4], [image5], [active]) VALUES (N'2332200008', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 1)
INSERT [dbo].[DatingProfile] ([userID], [nickName], [location], [isHaveChild], [gender], [detail], [image1], [image2], [image3], [image4], [image5], [active]) VALUES (N'2822200000', N'TaoLaThang', N'Đà Nẵng', N'Chưa có', N'Nữ', N'Oke', N'01 (3).png', N'', N'', N'', N'', 2)
INSERT [dbo].[DatingProfile] ([userID], [nickName], [location], [isHaveChild], [gender], [detail], [image1], [image2], [image3], [image4], [image5], [active]) VALUES (N'2822200001', N'Fooo', N'Đà Nẵng Ngũ Hành sơn', N'Chưa có', N'Nam', N'Nhân tri sơ tính bản ác', N'01 (29).png', N'01 (6).png', N'01 (5).png', N'01 (15).png', N'01 (3).png', 2)
INSERT [dbo].[DatingProfile] ([userID], [nickName], [location], [isHaveChild], [gender], [detail], [image1], [image2], [image3], [image4], [image5], [active]) VALUES (N'332200003', N'hung', N'Binh Dinh', N'Chưa có', N'Nam', N'qưeeqweqwe', N'01 (25).png', N'', N'', N'', N'', 2)
GO
SET IDENTITY_INSERT [dbo].[Like] ON 

INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (52, N'P952968', N'2822200000')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (53, N'P382533', N'2822200001')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (54, N'P382533', N'132200002')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (55, N'P382533', N'1432200005')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (56, N'P382533', N'1932200007')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (57, N'P357618', N'2822200000')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (58, N'P164197', N'2822200001')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (63, N'P375117', N'1432200005')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (64, N'P748780', N'332200003')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (65, N'P748780', N'2822200000')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (66, N'P952935', N'2822200001')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (67, N'P952968', N'2332200008')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (68, N'P952968', N'2822200001')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (69, N'P125815', N'2332200008')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (70, N'P125815', N'2822200001')
INSERT [dbo].[Like] ([likeID], [postID], [userID]) VALUES (71, N'P576741', N'2822200000')
SET IDENTITY_INSERT [dbo].[Like] OFF
GO
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'thế này cũng ok rồi', N'9/3/2022-23/51/13', 6, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'gi m', N'10/3/2022-0/31/15', 10, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'2822200001', N'Phú', N'10/3/2022-0/32/0', 5, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'k có gì', N'10/3/2022-0/34/18', 11, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'2822200001', N'hmmmmmmmm', N'10/3/2022-8/5/55', 7, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'demo tiếp nè', N'10/3/2022-8/6/26', 12, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'demo gì', N'10/3/2022-8/6/36', 13, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'c', N'10/3/2022-8/12/1', 0, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'@@', N'10/3/2022-8/13/6', 2, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'vl hết hồn', N'10/3/2022-8/27/22', 3, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'?', N'10/3/2022-8/36/34', 4, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'clm ', N'10/3/2022-8/47/46', 6, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'ok', N'10/3/2022-9/24/5', 8, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'@@', N'10/3/2022-9/26/38', 9, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'test', N'10/3/2022-9/42/43', 16, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'vl', N'10/3/2022-12/51/45', 18, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'vl', N'10/3/2022-12/51/55', 11, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'2822200001', N'ádsaasdsa', N'10/3/2022-14/6/4', 8, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'chao ban', N'10/3/2022-16/17/1', 20, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'@@', N'11/3/2022-0/14/14', 21, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'@@', N'11/3/2022-0/14/28', 23, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'oke', N'11/3/2022-0/14/53', 26, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'tự nhiên m kêu m chi', N'11/3/2022-0/15/25', 13, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'kkkkkkk', N'11/3/2022-0/15/36', 14, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'mà mai m có đi học k', N'11/3/2022-0/16/10', 27, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'có chứ ba', N'11/3/2022-0/16/23', 28, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'2822200000', N'hi', N'11/3/2022-0/18/5', 0, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'132200002', N'hi', N'11/3/2022-0/18/47', 2, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'như quần què', N'11/3/2022-0/20/10', 15, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'2822200000', N'uk', N'11/3/2022-9/38/43', 5, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'2822200001', N'hi', N'12/3/2022-23/6/20', 0, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'2822200001', N'hhhhh', N'12/3/2022-23/6/41', 2, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'hú', N'13/3/2022-17/34/15', 16, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'yugtghjghj', N'13/3/2022-17/34/28', 17, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'kkkkkkkkkk', N'13/3/2022-17/36/22', 18, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'hhhhhhhh', N'13/3/2022-17/37/13', 19, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'1132200004', N'ước được thua', N'13/3/2022-20/46/57', 4, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'1132200004', N'sao k thử cách này sớm hơn', N'13/3/2022-20/47/14', 6, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'haha', N'13/3/2022-21/10/8', 22, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'không sao', N'13/3/2022-21/10/11', 23, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N':(((((', N'13/3/2022-21/12/6', 25, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'@@', N'13/3/2022-21/12/39', 26, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'1432200005', N'cút cmm đi', N'14/3/2022-22/36/36', 3, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'kk', N'15/3/2022-10/7/52', 4, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'kkk', N'15/3/2022-13/33/5', 8, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'còn vài chỗ cần fix', N'15/3/2022-13/34/7', 10, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'1432200005', N'oke fix đi', N'15/3/2022-13/34/13', 11, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'132200002', N'rt', N'15/3/2022-21/5/53', 7, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'132200002', N'32432', N'15/3/2022-21/6/19', 8, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'Hello bạn', N'17/3/2022-13/46/14', 30, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'1132200004', N'hú', N'17/3/2022-13/47/14', 8, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'2822200001', N'@@', N'17/3/2022-13/56/52', 11, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'má demo nhầm chỗ', N'17/3/2022-13/57/38', 33, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'vcl', N'17/3/2022-13/57/43', 34, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'2822200000', N'Ngày Mai Anh Không Còn Có Em Bên Cạnh Nữa Anh Không Biết Sẽ Ra Sao Nếu Như Em Biến Mất Khỏi Cuộc Đời Anh', N'18/3/2022-10/54/46', 10, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'2822200000', N'Ngày Mai Anh Không Còn Có Em Bên Cạnh Nữa Anh Không Biết Sẽ Ra Sao Nếu Như Em Biến Mất Khỏi Cuộc Đời AnhNgày Mai Anh Không Còn Có Em Bên Cạnh Nữa Anh Không Biết Sẽ Ra Sao Nếu Như Em Biến Mất Khỏi Cuộc Đời AnhNgày Mai Anh Không Còn Có Em Bên Cạnh Nữa Anh Không Biết Sẽ Ra Sao Nếu Như Em Biến Mất Khỏi Cuộc Đời AnhNgày Mai Anh Không Còn Có Em Bên Cạnh Nữa Anh Không Biết Sẽ Ra Sao Nếu Như Em Biến Mất Khỏi Cuộc Đời AnhNgày Mai Anh Không Còn Có Em Bên Cạnh Nữa Anh Không Biết Sẽ Ra Sao Nếu Như Em Biến Mất Khỏi Cuộc Đời AnhNgày Mai Anh Không Còn Có Em Bên Cạnh Nữa Anh Không Biết Sẽ Ra Sao Nếu Như Em Biến Mất Khỏi Cuộc Đời Anh', N'18/3/2022-10/55/2', 11, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'jkdfksjdfjksdfd', N'19/3/2022-21/3/50', 12, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'Hack cai lol', N'19/3/2022-21/55/27', 13, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'332200003', N'có nhiu đó mà mỏ', N'23/3/2022-20/26/44', 13, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'2822200000', N's', N'23/3/2022-20/39/47', 14, 1, 2, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'd', N'23/3/2022-21/40/8', 14, 1, 2, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'fkj', N'23/3/2022-21/40/15', 15, 1, 2, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C982551', N'2822200000', N'chào', N'23/3/2022-21/44/6', 0, 1, 2, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'chời ơi', N'10/3/2022-8/7/14', 14, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'chuyện gì', N'11/3/2022-0/14/42', 24, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'1132200004', N'không có gì bạn ơi', N'17/3/2022-13/47/40', 10, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'2822200000', N'g', N'23/3/2022-20/39/40', 12, 1, 2, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'2822200000', N's', N'23/3/2022-20/39/44', 13, 1, 2, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C339629', N'2332200008', N'Mai báo cáo ', N'23/3/2022-22/4/24', 0, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C339629', N'2822200001', N'Oke', N'23/3/2022-22/4/54', 2, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C339629', N'2332200008', N'bdfdsj', N'24/3/2022-10/35/54', 3, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C339629', N'2332200008', N'I''m Iron man', N'24/3/2022-10/36/12', 4, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C339629', N'2822200001', N'hahahahaha', N'24/3/2022-10/44/18', 5, 1, 2, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'hi', N'9/2/2022-23/41/3', 0, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'chào bạn', N'9/2/2022-23/42/36', 2, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N':v', N'9/2/2022-23/46/24', 3, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'cvsdf', N'9/2/2022-23/47/38', 4, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'hi', N'9/3/2022-23/48/16', 5, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'2822200001', N'haha', N'9/3/2022-23/56/41', 0, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'2822200001', N'Thấy thế nào người ae', N'9/3/2022-23/57/21', 2, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'hi', N'10/3/2022-0/25/58', 8, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'2822200001', N'123', N'10/3/2022-0/26/24', 3, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'2', N'10/3/2022-0/30/16', 9, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'2822200001', N'23', N'10/3/2022-0/31/7', 4, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'2822200001', N'thôi đi ngủ', N'10/3/2022-1/5/9', 6, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'332200003', N'sadadas', N'10/3/2022-14/6/9', 9, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'332200003', N'chán', N'10/3/2022-16/48/9', 10, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'?', N'11/3/2022-0/14/23', 22, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'2822200001', N'?', N'13/3/2022-20/45/12', 3, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'2822200001', N'vcl', N'13/3/2022-20/47/3', 5, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'vc quên rep', N'13/3/2022-21/8/49', 21, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'hi', N'15/3/2022-13/27/21', 5, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'@@', N'10/3/2022-0/17/20', 7, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'', N'10/3/2022-9/58/46', 17, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'Phú', N'10/3/2022-12/52/0', 12, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'2822200000', N'uk', N'11/3/2022-9/38/43', 6, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'1432200005', N'vl', N'15/3/2022-13/33/53', 9, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'2822200001', N'fix mỏi', N'18/3/2022-20/15/15', 12, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'hmmmmmm', N'10/3/2022-8/7/28', 15, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'??', N'10/3/2022-8/39/8', 5, 1, 1, 1)
GO
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'?', N'10/3/2022-8/48/11', 7, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'trả lời được k', N'10/3/2022-9/27/5', 10, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'chaof', N'10/3/2022-16/16/51', 19, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C231095', N'332200003', N'Lỗi tùm lum', N'10/3/2022-20/54/45', 11, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'mai kể cho nghe', N'11/3/2022-0/14/49', 25, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'2822200000', N':(', N'11/3/2022-0/18/59', 3, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'132200002', N':v', N'11/3/2022-0/19/16', 4, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'hgfhg', N'13/3/2022-17/37/33', 20, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200001', N'hi', N'13/3/2022-21/11/33', 24, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'lô', N'14/3/2022-22/36/30', 2, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'haha', N'17/3/2022-13/57/27', 32, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'2822200001', N'ai biết mà thử ba', N'13/3/2022-20/47/21', 7, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'lol', N'13/3/2022-21/13/14', 27, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'1432200005', N'hê lô ku', N'14/3/2022-22/36/5', 0, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'jnjza', N'15/3/2022-13/27/38', 6, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C562862', N'2822200000', N'chào bạn', N'15/3/2022-13/31/36', 7, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C240327', N'132200002', N'hâhha', N'15/3/2022-21/6/29', 9, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'132200002', N'Sao k rủ t', N'15/3/2022-21/6/43', 29, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C585344', N'2822200001', N'Chào bạn', N'17/3/2022-13/46/36', 31, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'2822200001', N'gì bạn ơi', N'17/3/2022-13/47/24', 9, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C807939', N'1132200004', N'@@ cái gì', N'17/3/2022-13/57/2', 12, 1, 1, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C122569', N'2822200000', N'Hi', N'20/3/2022-20/44/53', 28, 1, 2, 1)
INSERT [dbo].[MessageContent] ([ConversationID], [senderID], [content], [time], [sttMessage], [type], [status1], [status2]) VALUES (N'C339629', N'2822200001', N'', N'24/3/2022-10/54/32', 6, 1, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N103849', N'2332200008', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P125815', N'fa fa-comment', 0, N'22-7-19-23-3-2022', 111)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N109061', N'332200003', N'2822200001', N'Bạn và Huỳnh Bá Phú đã được se duyên!', N'loadDatingDetail?userID=2822200001&notiID=N109061', N'fa fa-heart', 0, N'21-42-49-15-3-2022', 22)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N119933', N'2822200001', N'2822200000', N'Nguyễn đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=2822200000', N'fa fa-heart', 0, N'21-48-48-10-3-2022', 5)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N134461', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN12', N'fa fa-comment', 0, N'9-20-35-18-3-2022', 30)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N143253', N'2822200000', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P718358', N'fa fa-comment', 0, N'16-3-7-20-3-2022', 79)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N153820', N'132200002', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P357618', N'fa fa-comment', 0, N'15-51-4-20-3-2022', 77)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N159770', N'132200002', N'332200003', N'Bạn và Lâm  Hùng đã được se duyên!', N'loadDatingDetail?userID=332200003&notiID=N159770', N'fa fa-heart', 0, N'13-51-13-15-3-2022', 18)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N183937', N'2822200001', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=SN17', N'fa fas-heart', 0, N'15-5-22-19-3-2022', 55)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N184122', N'2822200001', N'2822200000', N'Bạn có một bình luận mới!', N'#', N'fa fa-heart', 0, N'22-19-16-17-3-2022', 27)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N197551', N'2332200008', N'2822200001', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P952968', N'fa fa-comment', 0, N'22-3-53-23-3-2022', 108)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N225936', N'2822200000', N'2822200001', N'Bài viết của bạn đã bị xóa vì bị báo cáo là: Ngôn từ gây thù ghét', N'loadNotificationPage', N'fa fa-trash', 0, N'10-4-43-24-3-2022', 114)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N226240', N'2822200001', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN15', N'fa fa-comment', 0, N'10-48-35-18-3-2022', 35)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N228006', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN15', N'fa fa-comment', 0, N'10-9-18-19-3-2022', 45)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N234861', N'132200002', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P375117', N'fa fas-heart', 1, N'19-43-7-23-3-2022', 95)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N236315', N'332200003', N'132200002', N'Bạn và Nguyễn Huỳnh Thắng đã được se duyên!', N'loadDatingDetail?userID=132200002&notiID=N236315', N'fa fa-heart', 0, N'13-49-11-15-3-2022', 16)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N237813', N'132200002', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P375117', N'fa fas-heart', 1, N'19-44-8-23-3-2022', 96)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N246917', N'1132200004', N'2822200001', N'Phú đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=2822200001', N'fa fa-heart', 1, N'14-2-12-11-3-2022', 13)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N267102', N'132200002', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P357618', N'fa fa-comment', 1, N'15-50-50-20-3-2022', 76)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N272017', N'332200003', N'2822200000', N'Bạn và Nguyễn Huỳnh Thắng đã được se duyên!', N'loadDatingDetail?userID=2822200000&notiID=N272017', N'fa fa-heart', 0, N'12-39-51-11-3-2022', 11)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N303161', N'2332200008', N'2822200001', N'Phú đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=2822200001', N'fa fa-heart', 1, N'21-46-57-23-3-2022', 104)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N307068', N'2822200001', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=SN17', N'fa fas-heart', 0, N'15-2-47-19-3-2022', 53)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N309323', N'2332200008', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P125815', N'fa fa-comment', 0, N'10-8-43-24-3-2022', 122)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N311523', N'2822200001', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN15', N'fa fa-comment', 0, N'15-16-24-19-3-2022', 63)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N341198', N'2822200001', N'132200002', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P718358', N'fa fa-comment', 0, N'16-4-10-20-3-2022', 84)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N351003', N'332200003', N'132200002', N'Bạn và Nguyễn Huỳnh Thắng đã được se duyên!', N'loadDatingDetail?userID=132200002&notiID=N351003', N'fa fa-heart', 0, N'13-52-38-15-3-2022', 20)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N409536', N'2822200001', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P952968', N'fa fa-comment', 0, N'20-16-45-19-3-2022', 67)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N459190', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN15', N'fa fa-comment', 0, N'10-49-40-18-3-2022', 36)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N471369', N'132200002', N'332200003', N'Bạn và Lâm  Hùng đã được se duyên!', N'loadDatingDetail?userID=332200003&notiID=N471369', N'fa fa-heart', 0, N'13-52-38-15-3-2022', 21)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N476399', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN13', N'fa fa-comment', 0, N'10-30-6-18-3-2022', 32)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N482015', N'2822200000', N'132200002', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P718358', N'fa fa-comment', 0, N'16-4-10-20-3-2022', 83)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N486789', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN6', N'fa fa-comment', 0, N'15-44-39-18-3-2022', 39)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N492224', N'132200002', N'2822200001', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P718358', N'fa fa-comment', 0, N'16-3-7-20-3-2022', 80)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N502163', N'2822200000', N'132200002', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P718358', N'fa fa-comment', 0, N'7-46-27-23-3-2022', 88)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N504278', N'132200002', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P164197', N'fa fa-comment', 1, N'10-7-51-24-3-2022', 120)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N504703', N'2822200001', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=SN17', N'fa fas-heart', 0, N'15-5-27-19-3-2022', 56)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N511447', N'2822200001', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN15', N'fa fa-comment', 0, N'19-43-8-18-3-2022', 41)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N521553', N'132200002', N'2822200000', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P718358', N'fa fa-comment', 0, N'16-4-1-20-3-2022', 81)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N525315', N'132200002', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P164197', N'fa fa-comment', 0, N'8-6-36-23-3-2022', 91)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N529261', N'132200002', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P164197', N'fa fas-heart', 1, N'8-6-18-23-3-2022', 90)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N532437', N'332200003', N'132200002', N'Bạn và Nguyễn Huỳnh Thắng đã được se duyên!', N'loadDatingDetail?userID=132200002&notiID=N532437', N'fa fa-heart', 0, N'13-51-13-15-3-2022', 19)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N534113', N'1432200005', N'2822200001', N'Phú đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=2822200001', N'fa fa-heart', 1, N'13-45-30-15-3-2022', 15)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N545322', N'132200002', N'332200003', N'Bạn và Lâm  Hùng đã được se duyên!', N'loadDatingDetail?userID=332200003&notiID=N545322', N'fa fa-heart', 0, N'13-49-11-15-3-2022', 17)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N546303', N'2822200001', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postIDSN18', N'fa fas-heart', 0, N'14-55-48-19-3-2022', 50)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N549860', N'2822200001', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=SN17', N'fa fas-heart', 0, N'14-56-46-19-3-2022', 51)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N567727', N'2822200001', N'2822200000', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P952968', N'fa fas-heart', 0, N'22-39-19-19-3-2022', 69)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N596136', N'2822200000', N'132200002', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P718358', N'fa fa-comment', 0, N'16-2-40-20-3-2022', 78)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N596224', N'132200002', N'2822200001', N'Phú đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=2822200001', N'fa fa-heart', 0, N'23-35-23-20-3-2022', 86)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N596902', N'1432200005', N'132200002', N'Thắng đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=132200002', N'fa fa-heart', 1, N'9-40-56-16-3-2022', 24)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N603408', N'2822200001', N'332200003', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P748780', N'fa fas-heart', 0, N'20-28-18-23-3-2022', 100)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N616379', N'1432200005', N'2822200001', N'Phú đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=2822200001', N'fa fa-heart', 1, N'9-59-7-16-3-2022', 25)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N620705', N'2822200001', N'132200002', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P718358', N'fa fa-comment', 0, N'7-46-27-23-3-2022', 89)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N630696', N'2822200001', N'332200003', N'Bạn và Lâm  Hùng đã được se duyên!', N'loadDatingDetail?userID=332200003&notiID=N630696', N'fa fa-heart', 0, N'21-42-49-15-3-2022', 23)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N649397', N'2822200001', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=SN17', N'fa fas-heart', 0, N'15-5-28-19-3-2022', 57)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N652162', N'2822200001', N'2332200008', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P125815', N'fa fa-comment', 0, N'10-40-50-24-3-2022', 132)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N656513', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN9', N'fa fa-comment', 0, N'15-56-42-18-3-2022', 40)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N659146', N'2822200001', N'2822200000', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P718358', N'fa fa-comment', 0, N'16-4-1-20-3-2022', 82)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N675784', N'132200002', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P375117', N'fa fas-heart', 1, N'19-43-5-23-3-2022', 94)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N677593', N'2822200000', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P382533', N'fa fas-heart', 0, N'22-39-41-19-3-2022', 70)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N698165', N'1432200005', N'2822200001', N'Phú đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=2822200001', N'fa fa-heart', 0, N'9-59-29-16-3-2022', 26)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N699999', N'2332200008', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P125815', N'fa fas-heart', 0, N'22-7-11-23-3-2022', 110)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N724215', N'2822200001', N'1132200004', N'Thang đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=1132200004', N'fa fa-heart', 0, N'20-2-33-23-3-2022', 98)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N728939', N'332200003', N'132200002', N'Bạn và Thắng Huỳnh Nguyễn đã được se duyên!', N'loadDatingDetail?userID=132200002&notiID=N728939', N'fa fa-heart', 0, N'15-27-7-10-3-2022', 4)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N739893', N'2822200000', N'1432200005', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P382533', N'fa fas-heart', 0, N'22-39-59-19-3-2022', 72)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N765873', N'132200002', N'1432200005', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P375117', N'fa fas-heart', 1, N'19-44-29-23-3-2022', 97)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N769286', N'132200002', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P357618', N'fa fa-comment', 0, N'14-2-41-20-3-2022', 75)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N769856', N'132200002', N'2822200000', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P357618', N'fa fas-heart', 1, N'14-2-31-20-3-2022', 74)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N787114', N'2822200001', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=SN17', N'fa fas-heart', 0, N'15-2-7-19-3-2022', 52)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N791556', N'2822200001', N'2822200000', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P748780', N'fa fas-heart', 0, N'20-32-3-23-3-2022', 101)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N793744', N'2822200001', N'2332200008', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P952968', N'fa fas-heart', 0, N'22-3-2-23-3-2022', 105)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N802248', N'2822200000', N'132200002', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P357618', N'fa fa-comment', 0, N'7-43-7-23-3-2022', 87)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N803020', N'2822200001', N'132200002', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P164197', N'fa fa-comment', 0, N'8-8-37-23-3-2022', 92)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N809039', N'2822200001', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=SN17', N'fa fas-heart', 0, N'15-5-1-19-3-2022', 54)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N816320', N'2822200000', N'132200002', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P382533', N'fa fas-heart', 0, N'22-39-50-19-3-2022', 71)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N816927', N'332200003', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P952935', N'fa fas-heart', 1, N'20-32-57-23-3-2022', 102)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N824047', N'132200002', N'332200003', N'Bạn và Hùng  Lâm đã được se duyên!', N'loadDatingDetail?userID=332200003&notiID=N824047', N'fa fa-heart', 0, N'15-27-7-10-3-2022', 3)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N854014', N'332200003', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=P952935', N'fa fa-comment', 1, N'20-33-9-23-3-2022', 103)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N854841', N'132200002', N'2822200001', N'Phú đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=2822200001', N'fa fa-heart', 0, N'20-7-44-20-3-2022', 85)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N855162', N'2822200001', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN15', N'fa fa-comment', 0, N'10-49-57-18-3-2022', 37)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N860449', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN12', N'fa fa-comment', 0, N'10-33-44-18-3-2022', 33)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N868898', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN6', N'fa fa-comment', 0, N'9-49-55-18-3-2022', 31)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N870940', N'132200002', N'332200003', N'Bạn và Hùng  Lâm đã được se duyên!', N'loadDatingDetail?userID=332200003&notiID=N870940', N'fa fa-heart', 0, N'15-6-5-10-3-2022', 2)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N888316', N'2822200000', N'2822200001', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P952968', N'fa fa-comment', 0, N'22-3-53-23-3-2022', 109)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N908822', N'2822200000', N'2332200008', N'Bài viết bạn quan tâm có một bình luận mới!', N'loadPostDetailPage?postID=P952968', N'fa fa-comment', 0, N'22-3-34-23-3-2022', 107)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N925868', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN15', N'fa fa-comment', 0, N'10-9-36-19-3-2022', 46)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N929167', N'2822200001', N'2822200000', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P952968', N'fa fas-heart', 0, N'20-16-55-19-3-2022', 68)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N964177', N'2822200001', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN12', N'fa fa-comment', 0, N'9-19-57-18-3-2022', 29)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N968381', N'132200002', N'2822200001', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P375117', N'fa fas-heart', 1, N'19-43-5-23-3-2022', 93)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N969398', N'2822200001', N'2822200000', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN15', N'fa fa-comment', 0, N'20-0-45-18-3-2022', 42)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N980849', N'2822200001', N'2822200001', N'Bạn có một bình luận mới!', N'loadPostDetailPage?postID=SN15', N'fa fa-comment', 0, N'10-50-43-18-3-2022', 38)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N982665', N'1132200004', N'2822200000', N'Thắng đã đồng ý lời mời kết bạn của bạn!', N'getUserInfor?userID=2822200000', N'fa fa-heart', 1, N'20-14-38-23-3-2022', 99)
INSERT [dbo].[Notification] ([notificationID], [receiverID], [delivererID], [message], [link], [icon], [status], [date], [stt]) VALUES (N'N999948', N'2822200000', N'1932200007', N'Đã thích bài viết của bạn!', N'loadPostDetailPage?postID=P382533', N'fa fas-heart', 0, N'22-40-19-19-3-2022', 73)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P124960', N'1132200004', N'2822200000', N'1', N'C982551')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P134602', N'1432200005', N'132200002', N'1', NULL)
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P141787', N'2822200001', N'132200002', N'1', N'C585344')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P161943', N'1432200005', N'1132200004', N'5', NULL)
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P207677', N'2822200000', N'1132200004', N'1', N'C982551')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P379981', N'2822200001', N'332200003', N'1', N'C231095')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P392937', N'2822200001', N'2822200000', N'1', N'C122569')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P401876', N'2822200000', N'1432200005', N'1', N'C562862')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P407124', N'2822200000', N'132200002', N'1', N'C240327')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P419018', N'132200002', N'1432200005', N'1', NULL)
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P541402', N'1132200004', N'1432200005', N'5', NULL)
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P586025', N'2822200001', N'2332200008', N'1', N'C339629')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P648608', N'2822200001', N'1132200004', N'5', N'C807939')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P682731', N'2822200000', N'2822200001', N'1', N'C122569')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P714252', N'132200002', N'2822200000', N'1', N'C240327')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P774578', N'2332200008', N'2822200001', N'1', N'C339629')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P815077', N'1132200004', N'2822200001', N'5', N'C807939')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P841394', N'132200002', N'2822200001', N'1', N'C585344')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P927054', N'1432200005', N'2822200000', N'1', N'C562862')
INSERT [dbo].[Participant] ([participantID], [userID1], [userID2], [status], [conversationID]) VALUES (N'P951875', N'332200003', N'2822200001', N'1', N'C231095')
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P125815', N'2332200008', N'', N'image', NULL, NULL, N'23/3/2022-22/5/9', 45)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P164197', N'132200002', N'', N'image', NULL, NULL, N'23/3/2022-7/59/54', 39)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P208713', N'2822200000', N'Không xác định', N'text', NULL, NULL, N'19/3/2022-22/9/30', 27)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P320251', N'332200003', N'', N'avatar', NULL, NULL, N'23/3/2022-20/23/22', 41)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P357618', N'132200002', N'Ôi cuộc sống thật đẹp', N'image', NULL, NULL, N'20/3/2022-14/1/10', 34)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P375117', N'132200002', N'', N'image', NULL, NULL, N'23/3/2022-8/4/10', 40)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P382533', N'2822200000', N'', N'avatar', NULL, NULL, N'19/3/2022-22/35/22', 30)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P506298', N'332200003', N'', N'background', NULL, NULL, N'23/3/2022-20/24/12', 43)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P539382', N'1932200007', N'', N'avatar', NULL, NULL, N'20/3/2022-11/31/28', 32)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P554311', N'1932200007', N'Được rồi, mình sẽ cố gắng hết sức để có thể đạt được những gì mình muốn', N'text', NULL, NULL, N'20/3/2022-11/32/11', 33)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P576741', N'2822200001', N'', N'avatar', NULL, NULL, N'24/3/2022-9/29/48', 46)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P718358', N'2822200000', N'Quy Nhơn <3', N'image', NULL, NULL, N'20/3/2022-11/27/14', 31)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P748780', N'2822200001', N':v', N'text', NULL, NULL, N'19/03/2022-19/12/51', 24)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P768059', N'2822200000', N'Không xác định', N'text', NULL, NULL, N'19/3/2022-22/22/10', 28)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P899886', N'132200002', N'', N'avatar', NULL, NULL, N'21/3/2022-21/48/36', 35)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P909613', N'332200003', N'', N'background', NULL, NULL, N'23/3/2022-20/23/43', 42)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P943386', N'132200002', N'Ngày mai demo rồi, hi vọng không lỗi.', N'text', NULL, NULL, N'23/3/2022-7/56/46', 38)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P952935', N'332200003', N'', N'avatar', NULL, NULL, N'23/3/2022-20/25/24', 44)
INSERT [dbo].[Post] ([postID], [userID], [detail], [imageFile], [videoLink], [status], [posted_time], [sttPost]) VALUES (N'P952968', N'2822200001', N'Cải trang này đẹp chứ ae?', N'image', NULL, NULL, N'19/3/2022-19/28/3', 25)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([reportID], [postID], [accuser], [accused], [reason], [message], [link], [status], [date], [stt]) VALUES (N'R130513', N'P382533', N'1132200004', N'2822200000', N'Bán hàng trái phép', N'Báo cáo bài viết của Nguyễn Huỳnh Thắng', N'loadPostDetailPage?postID=P382533&reason=Bán hàng trái phép', 0, N'11-45-52-24-3-2022', 3)
INSERT [dbo].[Report] ([reportID], [postID], [accuser], [accused], [reason], [message], [link], [status], [date], [stt]) VALUES (N'R248987', N'P576741', N'2332200008', N'2822200001', N'Nội dung gớm ghiếc', N'Báo cáo bài viết của Huỳnh Bá Phú', N'loadPostDetailPage?postID=P576741&reason=Nội dung gớm ghiếc', 0, N'11-12-54-24-3-2022', 2)
INSERT [dbo].[Report] ([reportID], [postID], [accuser], [accused], [reason], [message], [link], [status], [date], [stt]) VALUES (N'R521985', N'P768059', N'1132200004', N'2822200000', N'Spam', N'Báo cáo bài viết của Nguyễn Huỳnh Thắng', N'loadPostDetailPage?postID=P768059&reason=Spam', 1, N'11-49-57-24-3-2022', 4)
SET IDENTITY_INSERT [dbo].[Report] OFF
GO
INSERT [dbo].[UserInformation] ([userID], [avatar], [background], [firstName], [middleName], [lastName], [birthDate], [sex], [phone], [email], [address], [education], [job], [hobbie], [ortherInterest], [imageFile], [fbLink], [instaLink], [emailLink], [tweetLink], [createAt]) VALUES (N'1132200004', N'01 (50).png', N'Null', N'Thang', N'', N'Nguyen', N'', N'', N'', N'thangnhde150387@fpt.edu.vn', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'11/3/2022                                         ')
INSERT [dbo].[UserInformation] ([userID], [avatar], [background], [firstName], [middleName], [lastName], [birthDate], [sex], [phone], [email], [address], [education], [job], [hobbie], [ortherInterest], [imageFile], [fbLink], [instaLink], [emailLink], [tweetLink], [createAt]) VALUES (N'132200002', N'01.png', N'ChÃº thÃ­ch 2020-01-08 233456.png', N'An', N'Thành', N'Trần', N'2001-05-24', N'Nam', N'', N'okbeyeu24@gmail.com', N'Việt Nam', N'FPT University', N'Sinh Viên FPT', N'Không thích gì', N'Thích tất cả', N'', N'', N'', N'', N'', N'1/3/2022                                          ')
INSERT [dbo].[UserInformation] ([userID], [avatar], [background], [firstName], [middleName], [lastName], [birthDate], [sex], [phone], [email], [address], [education], [job], [hobbie], [ortherInterest], [imageFile], [fbLink], [instaLink], [emailLink], [tweetLink], [createAt]) VALUES (N'1432200005', N'01 (62).png', N'Null', N'Thịnh Ngu', N'Hữu', N'Nguyễn', N'2001-06-06', N'Nam', N'052154854', N'okbeyeu25@gmail.com', N'Bình Định', N'ĐH Lạc Hồng', N'Sinh Viên', N'Bê Đê', N'', N'', N'', N'', N'', N'', N'14/3/2022                                         ')
INSERT [dbo].[UserInformation] ([userID], [avatar], [background], [firstName], [middleName], [lastName], [birthDate], [sex], [phone], [email], [address], [education], [job], [hobbie], [ortherInterest], [imageFile], [fbLink], [instaLink], [emailLink], [tweetLink], [createAt]) VALUES (N'1932200007', N'02 (19).png', N'Null', N'Chiên', N'', N'Xôi', N'', N'', N'', N'chiengxongxoi@gmail.com', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'19/3/2022                                         ')
INSERT [dbo].[UserInformation] ([userID], [avatar], [background], [firstName], [middleName], [lastName], [birthDate], [sex], [phone], [email], [address], [education], [job], [hobbie], [ortherInterest], [imageFile], [fbLink], [instaLink], [emailLink], [tweetLink], [createAt]) VALUES (N'2332200008', N'Null', N'Null', N'Dũng', N'', N'Vương', N'', N'', N'', N'dungvcde150071@fpt.edu.vn', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'23/3/2022                                         ')
INSERT [dbo].[UserInformation] ([userID], [avatar], [background], [firstName], [middleName], [lastName], [birthDate], [sex], [phone], [email], [address], [education], [job], [hobbie], [ortherInterest], [imageFile], [fbLink], [instaLink], [emailLink], [tweetLink], [createAt]) VALUES (N'2822200000', N'03 (41).png', N'IMG_20191205_150218.jpg', N'Thắng', N'Huỳnh', N'Nguyễn', N'2001-03-27', N'Nam', N'0378790754', N'thang24052001nguyen@gmail.com', N'Bình Định', N'FPT University', N'Sinh Viên FPT', N'Không thích gì', N'Khoong thich gi', N'', N'', N'', N'', N'', N'28/2/2022                                         ')
INSERT [dbo].[UserInformation] ([userID], [avatar], [background], [firstName], [middleName], [lastName], [birthDate], [sex], [phone], [email], [address], [education], [job], [hobbie], [ortherInterest], [imageFile], [fbLink], [instaLink], [emailLink], [tweetLink], [createAt]) VALUES (N'2822200001', N'01 (34).png', N'IMG_20200602_164054.jpg', N'Phú', N'Bá', N'Huỳnh', N'2001-02-15', N'Nam', N'0321548568', N'huynhbaphu2001@gmail.com', N'Đà Nẵng', N'FPT University Đà Nẵng', N'Dev', N'Coi Anime', N'kasdjhjkasgdjhasgdjkasdasdas', N'', N'', N'', N'', N'', N'28/2/2022                                         ')
INSERT [dbo].[UserInformation] ([userID], [avatar], [background], [firstName], [middleName], [lastName], [birthDate], [sex], [phone], [email], [address], [education], [job], [hobbie], [ortherInterest], [imageFile], [fbLink], [instaLink], [emailLink], [tweetLink], [createAt]) VALUES (N'332200003', N'02 (55).png', N'ChÃº thÃ­ch 2019-12-24 103327.png', N'Hùng', N'', N'Lâm', N'2001-12-03', N'Nữ', N'', N'lamquochung114x@gmail.com', N'', N'FHGJH', N'21321321', N'dsfdsfdsf', N'', N'', N'', N'', N'', N'', N'3/3/2022                                          ')
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([postID])
REFERENCES [dbo].[Post] ([postID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Dating]  WITH CHECK ADD  CONSTRAINT [FK_Dating_DatingProfile] FOREIGN KEY([userID])
REFERENCES [dbo].[DatingProfile] ([userID])
GO
ALTER TABLE [dbo].[Dating] CHECK CONSTRAINT [FK_Dating_DatingProfile]
GO
ALTER TABLE [dbo].[Dating]  WITH CHECK ADD  CONSTRAINT [FK_Dating_UserInformation] FOREIGN KEY([userID])
REFERENCES [dbo].[UserInformation] ([userID])
GO
ALTER TABLE [dbo].[Dating] CHECK CONSTRAINT [FK_Dating_UserInformation]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Post] FOREIGN KEY([postID])
REFERENCES [dbo].[Post] ([postID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Post]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Account] FOREIGN KEY([receiverID])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Account]
GO
ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [FK_Participant_Account] FOREIGN KEY([userID1])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[Participant] CHECK CONSTRAINT [FK_Participant_Account]
GO
ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [FK_Participant_Conversation] FOREIGN KEY([conversationID])
REFERENCES [dbo].[Conversation] ([conversationID])
GO
ALTER TABLE [dbo].[Participant] CHECK CONSTRAINT [FK_Participant_Conversation]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Account1] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Account1]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_Account] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_Account]
GO
