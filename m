Return-Path: <linux-mips+bounces-5427-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E55869706B9
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0DF128145B
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA851509AB;
	Sun,  8 Sep 2024 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="BLXBBX6s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M9F9SLip"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D48130A58;
	Sun,  8 Sep 2024 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725792587; cv=none; b=T6Y1Cl35CqJmGV3kn9de6YC7nX0xEjmkQ60+rcRpYl+ucSc4amdYWNgVVM2yySNap2ngk4YdHoNQuroRCwwh68OH9cEmmgbFNeleZegXu9um2yuaKZfYvkdFHbMx8Ahg76MdCzFCeeTe3FaRLF0ltD0X4nttYOtFQ+oHejjbvrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725792587; c=relaxed/simple;
	bh=WnDVh/mBzWHI1HvcDV/fqL3e5jgz2o/QsU/S25EbF3k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S2ABYS9pEwOGJG/smt1Of3xxZcMglU0pv8Wfc3i/hWjnwYs52qSQ2PVeSv9F/OsTH55J3dOLO9Z25kw5tupnoZ/+D44HjlyZmfcSJuPSF8mJaUaEoup06mnzfSuKpjlTNRH18iv+vS54XQZTHl2rYPjNMMtWvi37Ys3lUsp5r9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=BLXBBX6s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M9F9SLip; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8BA8A1140235;
	Sun,  8 Sep 2024 06:49:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 08 Sep 2024 06:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1725792585; x=1725878985; bh=0y
	coxOkrjIUGMZ/yUF5nv5wNKgLTMM/981XN8+Yi08k=; b=BLXBBX6sS5I0QmBYIj
	WpvcUm1LR8vRJjRU2fEukt0tDpXT6jZckEaT9jwJuHiABCZnOY8AfDlsfMPZgAdt
	vXq2pSy7SxJmdtZMGYol9GNhJU+zDXKxKb+GS1EifqDcYfeGTZ3VSb/uFYw4r+Eg
	1UV5fUkHfTbRSzGzyfUE1MC26WP4vf9WbnQnZ5kNEIJpbMkrBIW1FdhtNTcSTkNm
	vZu1aqBlcigFkHzxztTpx3CTMk2QDSgZgCjR3YJl5uaLtdw6BuWvrkc9XtopDs6X
	zjCdZIBJiSecelmbpqfZdC4hslciybtDvkiham8q9kA+sYb1B5TaS7kkRSbw55yZ
	FRYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725792585; x=1725878985; bh=0ycoxOkrjIUGM
	Z/yUF5nv5wNKgLTMM/981XN8+Yi08k=; b=M9F9SLipYelE+/42J/ZmnYvCABbqL
	UNcc9cWbwAt7T+x3MqarAxcButJ7vuj45mxaHHzJ9Npd15TDfJTnhoRXt5FpCvOu
	9tA9AfccJa7eF61rKU1cU5p5VhO/NwivCX/u2EtyHXipEQJTjtZr+IcmXjJ50ER8
	deacUhIXc1MDBDLKc841nO160MMzEihOhvZyRJp67+DeiHM74cZbQZ6uRaNAlSHA
	avXpnGI8dyUZPq2QOd0HrrPOFRy7iVNgqkdb9/OtpIRyvzdirstCSBuXMzqUsqIf
	Q1dndjWVNy1yypHHFwre0fv7NMP/PKPgsOciZiYPo55gK5FkAwBpG8Z8Q==
X-ME-Sender: <xms:SYHdZjy-m2Ujv1jOAd2cfqqZjmPX4iuzqmrC8zPmTnDWuMvmc7_DyQ>
    <xme:SYHdZrQDgN-1alg41Ehhp5chbeRLlnDdRE_0UzSMavih7faPVAp6aF0E1n_oVPYx3
    oumWY6QGEki8cwY7NM>
X-ME-Received: <xmr:SYHdZtWjJaY18EBA9x2eJCBVE50_yl_hTzInXVrR2I1Z0gq5xCYF1c5IN3pEAq1JiCs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhepudffffffhfeuheevhffgleevkeeugeet
    feegieeijeehfeekheekveduveeigeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtgho
    mhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjh
    hirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhnuhig
    qdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhg
    vghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggv
X-ME-Proxy: <xmx:SYHdZtiLd5JV6cu1w5TfPnIxGmWnxU1UgBv0WGx6CQPyZ9HIsmY7eA>
    <xmx:SYHdZlBf7jsr0UuIOu_2zoWxxYDfOS28PJhzblbVTnzeOExR7mIfkg>
    <xmx:SYHdZmIRx2yHVDwLfzzd7cNvcwQHBRO3hca4nb-cE58ta2GSq3okbQ>
    <xmx:SYHdZkAEVp-DDb8LOdEvmRjzhOM0NJ9KpusRfoNHrbOf5LThma7AcQ>
    <xmx:SYHdZg_b66h9cCCD99ccEWFmLFkSbiTYEfRxBZwYKbIPKmQ6hYKwjjaw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:49:44 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] MIPS: Chore clean ups
Date: Sun, 08 Sep 2024 11:49:41 +0100
Message-Id: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEWB3WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwML3dzMgmLd5Iz8olRdI9M0o2Qzs+RkYwsLJaCGgqLUtMwKsGHRsbW
 1ALOgOUdcAAAA
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=706;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=WnDVh/mBzWHI1HvcDV/fqL3e5jgz2o/QsU/S25EbF3k=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7jR7tsTWmZdtXxt/fsPx/3JJnVnPPvdr0Qe6mwcQeu
 77vnsvTO0pZGMS4GGTFFFlCBJT6NjReXHD9QdYfmDmsTCBDGLg4BWAiWVmMDBt8OGxrF+4yTyxZ
 8Uc+c0skb+GxFIWw4vQMjn3FN2/+3MHwV2yDzzRdecNS/gU8kXusz3nOmuJwZ8Gar69ZImctOX5
 rMyMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This is a spin-off from my mips-rust series, to fix some warnings,
misuse of data type.

Thanks

To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (2):
      MIPS: ftrace: Mark ftrace_get_parent_ra_addr as static
      MIPS: kprobes: Massage previous delay slot detection

 arch/mips/kernel/ftrace.c  |  4 ++--
 arch/mips/kernel/kprobes.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
change-id: 20240908-mips-chore-25f2c66cc388

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


