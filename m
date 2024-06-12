Return-Path: <linux-mips+bounces-3605-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98176904FA2
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03B69B24AFD
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 09:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7AD16E886;
	Wed, 12 Jun 2024 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="0LIRLYWb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iHU9gtD4"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D678C16DEDA;
	Wed, 12 Jun 2024 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186020; cv=none; b=s8FaovztbX8kZn0qJU8xeHjTJ6ukkQFLwpUCaAxP4TAu5xouPUpzwVc7j9qFMZFJFiwk5PxMkTfQBezvZX0bmfGa6nYNI7Y8VnBZrOkaesZckAw43EeVQ7S85HcskEmVm4Bibjeb8mCEEYAK6MRNWJJ4oznkyHCKrwey4UJN4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186020; c=relaxed/simple;
	bh=fCm2taCoWVcHA6K66WtthUu/hvdqStZPGA1RkuysGM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTehVYxtH3Pk0bQwqPFoQMn0dYDF3hWWjDQ8leSd7AB6ilezHRcjJA0MqUtSZTgzhi6neq42FtaqP9CnC6/Yjw2jLg2SNXe03yWHly9f+BZ3VYxrg/g1O4HEEQFumWmMgHM6FoMuD03ZfK0FjgP5F+EKRsAVLEYxpCpROQA8HRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=0LIRLYWb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iHU9gtD4; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id EBE8213801AE;
	Wed, 12 Jun 2024 05:53:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 12 Jun 2024 05:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186017;
	 x=1718272417; bh=O6282XamNJlPl4HPWNli2M3IiiGR1Ye3Z90xSD4Mn78=; b=
	0LIRLYWb66mhLsLPTZ4By2FaNSJwDUZFyfEsUxpKFiBtFcAgKTXktlp/GI9AhDKW
	wIvQLK3sQnfIRkQXjMbein7C/1oquan4WJMZdfsmws1u385Oonksxv+DjYQQwQcv
	HDhWr3o2RPJruxFUnyeXqPCE01/Hctr2Hhdvs8sIeyw7HAA9Ifh2WlqaMvw5+Afv
	TZupkIo72PNAWGSxbscUCFxEx3pFpHS43K3kWkqNRM+Mcsu72HVnB0lrcK537GeW
	rD3H+t49shSc7uYyam2v03qeg8dJPK8EAhVr+M1LyCVBYoV2Ei0qn+gOZhP80dbf
	AnnYuEAuz3d/QE4qIB3F8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186017; x=
	1718272417; bh=O6282XamNJlPl4HPWNli2M3IiiGR1Ye3Z90xSD4Mn78=; b=i
	HU9gtD4nxaYvYE3okVnOZho+GDKoGaiuB5IC8YwFJIfJ6yAQVeBjgQFdys1fzsNy
	sQVVhvDJ3tAdqbMpJLqzz7Ndh0JNFgziL2g8Q6jPqsro+8TI+Daju2q9YPZs3Hi6
	5O/KHRz0W8XAHef8bYFdQ29YpiqdorxbZW2u7JeryH6r9jlNIih/xG4kVCelN8VP
	SEhaY4wDhFGyUzRtnjiBTMR91Q5BozrQ2w/TE1rpssN8Il1YNLrf8stTkFilR4zJ
	zyAnpBDgfQztGomZLy4Dxdq+6vUUKk7y5IzdYvmG5waIl6dlxP0siEevLDdGqHo+
	bwGhYqB7DTKAw7BtSH4SA==
X-ME-Sender: <xms:IXBpZmMKAJHB5HWl_GSnkkpKHT2pE0PLkZTVbR617ywq4roUnSSvCA>
    <xme:IXBpZk96k3s3suNHRQVUFJhOHc2xD8JkPJ49zUI__73ZLYzPv4mKCHrYVX720j6te
    GP5KkskWjekBFWg4sQ>
X-ME-Received: <xmr:IXBpZtRl4lc-SLC-i0SeOhE0GHKoWZjXbc83ZWKwpKf8Gx2oVHNaqAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:IXBpZms_Nc-Y-sFauIj4EQwcuKTu_csHwY6JS9DLzexi7pwLPLyJ1g>
    <xmx:IXBpZufmjY2uj9xScHpX5qVSxnDiRkr0DkGDGYOf_PEfHTOCtu8kcQ>
    <xmx:IXBpZq12uXIrYJcQbRVEMmc94Qo07Z9x2_c7s52xwl-JnS9vbQIzgA>
    <xmx:IXBpZi-HsFkHQkpI7k3tA4SYR5RfV1-Gpoittc77U7nwD_0raaBVww>
    <xmx:IXBpZmTOYFFSmH4QKQ4rlY8z5Jyhk8GdjSg5vg8cDILhhdilUkQmVgU6>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 05:53:36 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 10:53:31 +0100
Subject: [PATCH v2 3/4] MIPS: Select ARCH_SUPPORTS_ATOMIC_RMW when possible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-llsc-v2-3-a42bd5562bdb@flygoat.com>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
In-Reply-To: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, 
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=698;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=fCm2taCoWVcHA6K66WtthUu/hvdqStZPGA1RkuysGM0=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMAlmfi/9cPXnmJHUfLGxUkre78HA5m9/vEyn7IiYLO
 5sFSc7tKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgImsDmX4zcq0arV6h6aZdE7W
 S6H+Qyu/scq8P8zdaxfAefA6e/ciY4b/qXsXtYRrvlRd2ZI3ISz7/qvaXy2z045pXXvBH1j2zsq
 CGQA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Select ARCH_SUPPORTS_ATOMIC_RMW when we are certain that our CPU
have LLSC support.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 50260a7e9b54..e83036580a47 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -23,6 +23,7 @@ config MIPS
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_SUPPORTS_ATOMIC_RMW if CPU_HAS_LLSC
 	select ARCH_SUPPORTS_HUGETLBFS if CPU_SUPPORTS_HUGEPAGES
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION

-- 
2.43.0


