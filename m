Return-Path: <linux-mips+bounces-5428-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB389706BB
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61949B21664
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36431531CB;
	Sun,  8 Sep 2024 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="KoteGGQY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iW2W4Wre"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB284B5AE;
	Sun,  8 Sep 2024 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725792588; cv=none; b=Wi/gGHHy1/87RlgPEDPdGLdg/dxnFqoIrAhHxHwc4OLkrw7EGze9/3F9ijxvLRsPrO+lJiJcBoMNIpQknDkOiKeqMUT0Y2QoZbZ9+MvkmT4U5dISSmWEk8MhorpNc5NT5fRV9OvMB0qs404BI9OVRK3op+cIxBbUztwiSaX0xqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725792588; c=relaxed/simple;
	bh=gPoxcCvMOPNbUND32tMngwCVFKGByJIbKWjHXDDvWUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BlOXwfhJDDGS97Dwg8WxX4d4C6rtm5FLZkSfvXkk0ux5uHFpACw77YspKUl2LHbmbbZWuve/fx42WBinxiQo5JZG2TL7i7Ph9flzugzG4/l7o8SOFoYim9/Al0RbsmEvhT5zAFuCSEnBNA2SDrAb4+vVbQLCDmDwc5CDwfUOVmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=KoteGGQY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iW2W4Wre; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 839D211402A7;
	Sun,  8 Sep 2024 06:49:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 08 Sep 2024 06:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725792586;
	 x=1725878986; bh=zWA14y3ger96EU3TugDKaEXMdxCpll5lPR6pZSKqCjI=; b=
	KoteGGQYPOp43jqBiFsL43osRkxc6cFYe2XTHjkfGdMDlHxF7/tgCPrRaneSRohw
	gJ2CQuDxduYf9wUw88mIylVhCG7hDlMb+EADtAOWLph6YPE54IvfATD4eE1RNZ3E
	6mjHbJeiN3ASZSC1mY6InbXx87MaeHdJuI+S8NPK0ZLzrjx1zreCBih9e0dR+XM3
	eDGUTkcGCW8xAO323NS+V6v8tTuX/tDxh2ert/LYumBJ3xUxByH408mol8JbmfS7
	Ws8tcdpXSxPHQzudl8JFMnHfhCjsXoSiHqQPzVfLSnqbhx0/gTCoBJCIcatOWZLK
	3T4xYkSuoci0gukjx1skmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725792586; x=
	1725878986; bh=zWA14y3ger96EU3TugDKaEXMdxCpll5lPR6pZSKqCjI=; b=i
	W2W4Wre6rglSz+Bf1NzjaQq4ux7mutuEhcX9j/+rvrVicvEyju1nmnw+1eJ9M2Id
	84FTUkHNkIePcAcpM4PZE3n0/PiikQ74lS5BldMuv5rQNdbnhk6mpkm8X8c5UWag
	YbtfH3/EhlLphTgokMw12VNovFtRSTG77iUDBu3nXzu6TMpRz7swK+ToVdpxd94Y
	2JH90NBYMq80VPXTv13ndVUMvhIqg2T3qQ35wbRwNCXK5LTA32FI5iyWhk5Rc5Qf
	rvwT/zu++gJIXFT04tCgnwjpT0YNZg68UXqzNmOLNwILqseMP1BipnqMfjAPxFop
	nHBiO78H/u7cARn5TjzUw==
X-ME-Sender: <xms:SoHdZgKkM3WLwqtscIE_A0i5yHhOaTqk13Z46HA4S8eUpUqfjhPyRw>
    <xme:SoHdZgK9JIJZYOCQA7W3j0W7YO63rhWbizmKqeiK9Ts6Wj8nq-2c5PYvppE25ZiE5
    GRvYYpIQmEgJ5vaysI>
X-ME-Received: <xmr:SoHdZguerFxO6tuy7krgGZeCkGV7jdJWf7kk53Vq92TIZFlDtj4NPKoOS3Cz0UOVCZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhn
    uhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgs
    ohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggv
X-ME-Proxy: <xmx:SoHdZtaYhAyOThoPibO2ybYnDlDGM4BlQoGtmoP_USW6O0o33jLuaQ>
    <xmx:SoHdZnYbUSsEZtBmQSgZletVGO3rxm-xbgHIdMJWVXzzN3AU_L_rBA>
    <xmx:SoHdZpBR43W3hHDDM_z1ys_fkRgKMJ5pXpEG2BniEEJGGPhf_oBtlg>
    <xmx:SoHdZtarbvBDRS4tEp07NzEffMI6Ws4rbym83Ld5zJPlVMLv8F1LnA>
    <xmx:SoHdZmWf3c_J24IH2YXAt6cv3bgXTp11bzyWwtyRluoD9EeitheDLCH0>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:49:45 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:49:42 +0100
Subject: [PATCH 1/2] MIPS: ftrace: Mark ftrace_get_parent_ra_addr as static
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-mips-chore-v1-1-9239c783f233@flygoat.com>
References: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com>
In-Reply-To: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=gPoxcCvMOPNbUND32tMngwCVFKGByJIbKWjHXDDvWUc=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7jR51XTVbPj+4drH3iJQgq05M7/7o5DInaccylWwDd
 tG1/oEdpSwMYlwMsmKKLCECSn0bGi8uuP4g6w/MHFYmkCEMXJwCMBHhnYwMPVbKxU0/o1c3fU/Y
 oskdcGV/UJhF0u47c73bN5pm1395xcgw7+z+4H+2yffuvz+8kutefxh3kvT0l58cwhfGqAmyv/f
 gAwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This function is only used in ftrace.c.

Mark as static to avoid compiler warning.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/ftrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index 8c401e42301c..96016eb1c476 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -248,8 +248,8 @@ int ftrace_disable_ftrace_graph_caller(void)
 #define S_R_SP	(0xafb0 << 16)	/* s{d,w} R, offset(sp) */
 #define OFFSET_MASK	0xffff	/* stack offset range: 0 ~ PT_SIZE */
 
-unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
-		old_parent_ra, unsigned long parent_ra_addr, unsigned long fp)
+static unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long old_parent_ra,
+					       unsigned long parent_ra_addr, unsigned long fp)
 {
 	unsigned long sp, ip, tmp;
 	unsigned int code;

-- 
2.46.0


