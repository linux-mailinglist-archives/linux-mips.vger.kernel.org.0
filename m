Return-Path: <linux-mips+bounces-3596-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F4904E8E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E596A2850E5
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 08:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC1216DECE;
	Wed, 12 Jun 2024 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="qLdo1kbK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eEDqldI7"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81F816DEAE;
	Wed, 12 Jun 2024 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182478; cv=none; b=NqtLNy2oaMPB+/JWvoepoigbB7ZWYTE1+uWcoGiYoxZ0fmMlF5Zoum6Ing4kC5tfrbMUhRHm0W3aFUEmlEZdZAbp3z4nZm0fqSFrgK/WpDStaCQgf8ncsNhs4SyJOQRob251qtvMTY4+rCQ2b3y+OXQqq/KCQLj/MvRlH/kEFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182478; c=relaxed/simple;
	bh=1l2iw9HXUPl+0KsXVVzTlbq6pkrETw2qb2aFtEiqaXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEOeKSBjZCfVB+WIxh2+flefb0sl46n78e8CFLnAT/1SLaXkmYymAexLtYkVMtc+LW9BEdHUsXhR2rx8C/NZvZtP6IblIV/wUbl89nrvM0/vtPO+2nO/7j5nKpFXdOEZh+K1c973x9QGJuYDzGL/IUriBfBmy6zBrHCyp45Blkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=qLdo1kbK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eEDqldI7; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id C7ED513800D3;
	Wed, 12 Jun 2024 04:54:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 12 Jun 2024 04:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718182475;
	 x=1718268875; bh=JpX0NbJWnoQWVz/bJ4pYn1KJiy0U4HxA2hdsnqEDJEY=; b=
	qLdo1kbK+BrW8tZSCaj4/UdBulXlwHk/71ET/jwA732hFPevrlHGGWln0KxVQIMg
	Ed6togkVvUWrEtf9pdoC/j2u66+G+SI9GBSDR5ykbOlQgM2DRqjtVxlMbmz2p0lK
	+DyEQ+kylALrs8ybrgJ0ZoWybL94WXaPsC8VRrPBmipqeIIEtciDm3wSWqQhmrHD
	5Nv0tjNYBBibgfqL4L/LVt+ltcmuzDJxwCN2dK12NHVXvXXwoQEmrD/UipvX9iIT
	J7WhjomMkcuetqOKao0mETrPdfjZGFFKfuyOud3I8+dKADlJhSp7kOOqHRI5qrHI
	EmGG6uCmJSS1FPvUhgREPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718182475; x=
	1718268875; bh=JpX0NbJWnoQWVz/bJ4pYn1KJiy0U4HxA2hdsnqEDJEY=; b=e
	EDqldI7FcaoqjJn4dhZuqklR1po//AxLhYQlLt7a2W64LX3erq/USlubjFpgzj3g
	WjjJE+N4J+Q5K40nTPS53eCLZTWPjPzywbz3pKv6Q8EkM5OUtW5PSa9F0pitjV+a
	u3aXWJCTPJx4ifAcySSaE9/AN6L1MoG2wpCi7IpgwDDBjPSPZJnE9Nab2Bf6WGCZ
	/KwGpQ9/MrKVE3gf1mnq+AJ7AGJeZNlfV4ATivcm1daJ/PpG73PHeegH1j5IRhvO
	yca1QlEVJYcFH0F6Qa4zSRbZPyN2YrzAqDRI4rpegEuEnKAe2Qc9PY91unqJI73N
	Nw4KI7oymL961Bc7SHSZA==
X-ME-Sender: <xms:S2JpZoInS5TZd688qBy_hOdhr7dvmLfmZII0fAZTIaw9LQnZMvdIQw>
    <xme:S2JpZoK6TBndjG-IeTWdfjuzpyuiJc1k-Pfsj0v1B_sNtt73-lD8mQ3VhcFcpG6MY
    8HtHLT20fPk8bgz8j8>
X-ME-Received: <xmr:S2JpZouNdFgRU8jGH2kyS7jhJpxpeWfHdO11gDHGW4r4El8rlL191XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:S2JpZlaS0qsGNkZOCUOgA70fuvKcNTHgkNG8eCdZc-vmKmvCdCo7Dw>
    <xmx:S2JpZvZWrQ9cdE1hhp3t7u6QHY8grjl_q43enBuVR7ZKOGPlgojU8g>
    <xmx:S2JpZhCnnWgBAoIqQJWM0kN44QHzeK7UNTE3T8dCJByrJtx6MNqn8w>
    <xmx:S2JpZlYTloS-4vKvM-Ke2q22vTdNn36fn8TP6zR2KPJTqqtp7zw4Tw>
    <xmx:S2JpZtPuXdk13SdPSXDc0sH7sHRvoTmkgyfPbKhGt_x4eIVXe03DPAz_>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:54:34 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 09:54:29 +0100
Subject: [PATCH v2 2/7] MIPS: csrc-r4k: Apply verification clocksource
 flags
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-clks-v2-2-a57e6f49f3db@flygoat.com>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
In-Reply-To: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=1l2iw9HXUPl+0KsXVVzTlbq6pkrETw2qb2aFtEiqaXk=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMJPcDkbs4Jj35dGebfstlaykn8Wv/olI0M87deFIy+
 XBN/seZHaUsDGJcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjCRzIcM/zOerOPZ8/QxQ1Bd
 W0Hupz3PlZpfb5/LtznY/vJ5kd36D5kZGeYwNk194Fg/91bgZtEdDr7amSkesxdekms79cLhwvJ
 JvEwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

CP0 counter suffers from various problems like SMP sync,
behaviour on wait.

Set CLOCK_SOURCE_MUST_VERIFY and CLOCK_SOURCE_VERIFY_PERCPU,
as what x86 did to TSC, to let kernel test it before use.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/csrc-r4k.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index f02ae333f4f9..055747a7417d 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -21,7 +21,9 @@ static struct clocksource clocksource_mips = {
 	.name		= "MIPS",
 	.read		= c0_hpt_read,
 	.mask		= CLOCKSOURCE_MASK(32),
-	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS |
+				  CLOCK_SOURCE_MUST_VERIFY |
+				  CLOCK_SOURCE_VERIFY_PERCPU,
 };
 
 static u64 __maybe_unused notrace r4k_read_sched_clock(void)

-- 
2.43.0


