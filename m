Return-Path: <linux-mips+bounces-9813-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2783B053BD
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 09:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD97560B4E
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 07:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE1A271456;
	Tue, 15 Jul 2025 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="taIOEnfv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rtvKuufM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="taIOEnfv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rtvKuufM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC232727F9
	for <linux-mips@vger.kernel.org>; Tue, 15 Jul 2025 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752565966; cv=none; b=D0CJWkqV4arEpwt9doPTQ1QwXOPwcUx5X0Mw9M8eeaIgmqBsxn/D5NLc065+nVjGmAfK8goTAG+C46w87+K7nKzq77qqlDE0H56tPY1TF7YHoIscJQyqpHTCgCyVVgbVLK28jjDxwln+EcrQUnPrWY4wIZUAwLneSLKhSLPjTZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752565966; c=relaxed/simple;
	bh=cEUVdcujAERb/tj9Q8Lft0d+pDMMGvuNI0j0EYVcsso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4oL6QC3h2Dj7XQ65ezf3ynvCZ+tTlECLevYUkByAzJ5jVIa4KS48TWFRN+UONeACpTpIVD+3qI9PU2kOmxB3delipmD4FmHxzFaOceXVPNN4/tIMu8yI3EkIkQUbsxkEn6zxR8x3GRS04YBns5Md8fd98zLMcM2DkqaxbI3Ors=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=taIOEnfv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rtvKuufM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=taIOEnfv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rtvKuufM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E1331F397;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEUMF4eWRlQ8TLOqCX4QecdfnIvcNGC40IXakOIlkYc=;
	b=taIOEnfv5XpFwUHIq9YmCSWwsuSdzoq+S50lepaNcMy4sS9uoW0/Je1bG9VOQ3oO1rnKUC
	zoPlwNZHzAPjjisx0JR3eCB4t849ojbRooHaDim+S8EpSZjcwQd/FmzCNefXKxanB3m1xp
	9zK0sjpFgiERvP40hq21SyhluMkdBfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEUMF4eWRlQ8TLOqCX4QecdfnIvcNGC40IXakOIlkYc=;
	b=rtvKuufMAJJodP1eCX4Bnxt+30S918TVo+ahfOuIFInfUC53SjqTwwXuidnkx4HNT5wMRD
	FJvqCbgEYUB5mPDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=taIOEnfv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rtvKuufM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEUMF4eWRlQ8TLOqCX4QecdfnIvcNGC40IXakOIlkYc=;
	b=taIOEnfv5XpFwUHIq9YmCSWwsuSdzoq+S50lepaNcMy4sS9uoW0/Je1bG9VOQ3oO1rnKUC
	zoPlwNZHzAPjjisx0JR3eCB4t849ojbRooHaDim+S8EpSZjcwQd/FmzCNefXKxanB3m1xp
	9zK0sjpFgiERvP40hq21SyhluMkdBfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEUMF4eWRlQ8TLOqCX4QecdfnIvcNGC40IXakOIlkYc=;
	b=rtvKuufMAJJodP1eCX4Bnxt+30S918TVo+ahfOuIFInfUC53SjqTwwXuidnkx4HNT5wMRD
	FJvqCbgEYUB5mPDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CF7113A6C;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OOqLFcoIdmjnSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Jul 2025 07:52:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm: multi_v7_defconfig: Update HD-audio configs
Date: Tue, 15 Jul 2025 09:51:21 +0200
Message-ID: <20250715075237.28476-2-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715075237.28476-1-tiwai@suse.de>
References: <20250715075237.28476-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 8E1331F397
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Since the reorganization of HD-audio drivers, Realtek and HDMI codec
drivers have been split.  Update to the new Kconfigs to catch up.

Fixes: aeeb85f26c3b ("ALSA: hda: Split Realtek HD-audio codec driver")
Fixes: 73cd0490819d ("ALSA: hda/hdmi: Split vendor codec drivers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/20250715170422.5162c666@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I'm going to put to sound git tree if no one objects

 arch/arm/configs/multi_v7_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 50c170b4619f..02ddd7ce9e3e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -791,8 +791,11 @@ CONFIG_SND=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_INPUT_BEEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
-CONFIG_SND_HDA_CODEC_REALTEK=m
+CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
+CONFIG_SND_HDA_CODEC_ALC269=m
 CONFIG_SND_HDA_CODEC_HDMI=m
+CONFIG_SND_HDA_CODEC_HDMI_TEGRA=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_SOC=m
 CONFIG_SND_ATMEL_SOC=m
-- 
2.50.1


