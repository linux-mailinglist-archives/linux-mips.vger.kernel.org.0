Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA2E37B48A
	for <lists+linux-mips@lfdr.de>; Wed, 12 May 2021 05:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhELDcu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 May 2021 23:32:50 -0400
Received: from mail2.directv.syn-alias.com ([69.168.106.50]:52973 "EHLO
        mail.directv.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhELDcu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 May 2021 23:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha1; d=wildblue.net; s=20170921; c=relaxed/simple;
        q=dns/txt; i=@wildblue.net; t=1620790302;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=WUG3OZfoJL5GgRQMneId4hT4nLU=;
        b=q2Gj3ZgEMz93kiTEVcMyGgF9K09bt2IclttDL98SVikqLLBKUQJEWnoY1vlkDI3Q
        vzpS3Vs+Hc0CYd5nCOreb2MeuTSW1hOa3y7LVlyxUacALsLHn2r3PM0Pnzi1DCHj
        ONl+UcZyDIlC2jmdIbhyjVsP9T/RObny2kXx+ZWuic415rVKUFDIFIZVxYHSfPd1
        ooBhBpIa+ebeN7GD481CK4VhmPf8tYXJXGhKtLevsrLNwdaicvKJG0jxvELHvHNi
        auqCTanIwtjjTqF8wrF5nMIRBSII97CaFKgtrPdttRN0RCNEzVL2Xov+ld1La8uD
        kvnU0F3X6AaHuEo86liv8A==;
X-Authed-Username: c21pdGhncmluZGluZ0B3aWxkYmx1ZS5uZXQ=
Received: from [10.80.118.13] ([10.80.118.13:54458] helo=md07.jasper.bos.sync.lan)
        by mail2.directv.syn-alias.com (envelope-from <smithgrinding@wildblue.net>)
        (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTP
        id 9F/30-26161-D1C4B906; Tue, 11 May 2021 23:31:41 -0400
Date:   Tue, 11 May 2021 23:31:41 -0400 (EDT)
From:   Rowell Hambrick <smithgrinding@wildblue.net>
Reply-To: rwhambrick92@gmail.com
To:     fanxuexian200@126.com
Message-ID: <561138565.90781364.1620790301327.JavaMail.zimbra@wildblue.net>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [89.46.103.172]
X-Mailer: Zimbra 8.7.6_GA_1776 (zclient/8.7.6_GA_1776)
Thread-Index: pnfD9Be+v4yOoabHL+LPt4MFP1eXwQ==
Thread-Topic: 
X-Vade-Verditct: clean
X-Vade-Analysis: gggruggvucftvghtrhhoucdtuddrgeduledrvdehuddgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuufgjpfetvefqtfdpggfktefutefvpdfqfgfvnecuuegrihhlohhuthemuceftddunecugfhmphhthicushhusghjvggtthculddutddmnecujfgurhepfffhrhfvkffugggtgfhiofhtsehtjegttdertdejnecuhfhrohhmpeftohifvghllhcujfgrmhgsrhhitghkuceoshhmihhthhhgrhhinhguihhnghesfihilhgusghluhgvrdhnvghtqeenucggtffrrghtthgvrhhnpeeuhfelkedtteettedtveejveejffeikeejgfdtkeejkeeiudfhvdetgefgiedutdenucfkphepuddtrdektddruddukedrudefpdekledrgeeirddutdefrddujedvnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpedutddrkedtrdduudekrddufedphhgvlhhopehmugdtjedrjhgrshhpvghrrdgsohhsrdhshihntgdrlhgrnhdpmhgrihhlfhhrohhmpehsmhhithhhghhrihhnughinhhgseifihhluggslhhuvgdrnhgvthdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdphhhoshhtpehsmhhtphdrjhgrshhpvghrrdgsohhsrdhshihntgdrlhgrnhdpshhpfhepshhofhhtfhgrihhlpdgukhhimhep
X-Vade-Client: VIASAT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Did you get my previous mail
