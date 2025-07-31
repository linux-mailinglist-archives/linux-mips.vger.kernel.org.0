Return-Path: <linux-mips+bounces-9960-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 887FAB16C2E
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 08:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D6441887EB0
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 06:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D111C28D8F8;
	Thu, 31 Jul 2025 06:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1DyNygN+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HBMdvfdS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AbxKMfV3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GEpkOdu1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D2628D8CC
	for <linux-mips@vger.kernel.org>; Thu, 31 Jul 2025 06:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753944541; cv=none; b=ZtJqQPSEG1O/WpS4dj6bwTSbM8aFxXWUnvmWih4XHlVNMEESaU5x1IL8b4ZYozmraprTT8g8+eSqUR2qp44xHpc4K68sAYdjq8SCYcf27IlFKF95R3XSKM2hpxNYTp/2vd6qgj7NXSpl+zuxU6lI2huihfSNjEKjNnuZc7PnYxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753944541; c=relaxed/simple;
	bh=CqsFK7oDj01XXg0a94OMJm8oKUj+s55i2UDMBS/JovE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6oeUo638M1zRYqEcNLNuYfQ4kd84WAA21Xh+txmXChYH04OyyWGGaJXe+5YWT06SJdaa1E2uzD2+8nZyOuDaRiTxAidEYFmWurihP1plkc3XzyiJ8oF+uSzZNS8qblvEl2b17FCfN3FVI4oAz1oreTle4XlNcHNPB2jcT3vKWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1DyNygN+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HBMdvfdS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AbxKMfV3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GEpkOdu1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8FBD11FB88;
	Thu, 31 Jul 2025 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753944537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+Sr1yVB5vm02uTRDlNOKYJAicCZq7yfJFLlBIkZrtM=;
	b=1DyNygN+ZhfbGBe7OGIyIfwFynE76yyxnAtLxwQ6MKGaCgh/cDD7w5144hpuUcgQ7R9o0Q
	fBd7HhrxwHZ3WRq9f0tY3dRjSgm+Vs/lWZtmQn69WxvgXSRkvz3PPYkE8ul2+I87YyICN3
	4V9pmZNC822Zv6fm1ElW/inSSjOUePE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753944537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+Sr1yVB5vm02uTRDlNOKYJAicCZq7yfJFLlBIkZrtM=;
	b=HBMdvfdS9/vxvgiO33HuSE/Jmfrwf7IztvAVHA4A5VE2qQ0pm8rKUmIrl4kiGedtAh46zi
	5K/vAyTozJiMSGBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AbxKMfV3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GEpkOdu1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753944536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+Sr1yVB5vm02uTRDlNOKYJAicCZq7yfJFLlBIkZrtM=;
	b=AbxKMfV3EX1epuW7lqHOxfbIEFi3JUE3ziWlHiP8mKjxEsWgiA3bpUgKB2Jp/yQopJ4ttv
	y2lI1jIhywmr6byIm+eJpnZiRYFSbXcPnBIFvPi1Y/h7tRBHQZCYRN7kri0EnpmU0f8exs
	JzsNU1hBTVFVC/JSGP+iJdk4gR4QFv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753944536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+Sr1yVB5vm02uTRDlNOKYJAicCZq7yfJFLlBIkZrtM=;
	b=GEpkOdu1RJkT3v9Mm8HA3YgfYYL2j7yzpzfWsbMYHgA4z4qz/xltXHtJMuZvTzeNf3n3Iy
	oNHs95hslHkdZYDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AECE13AB4;
	Thu, 31 Jul 2025 06:48:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QFzgFNgRi2hnZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Jul 2025 06:48:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 3/3] mips: Update HD-audio configs again
Date: Thu, 31 Jul 2025 08:48:09 +0200
Message-ID: <20250731064813.1622-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731064813.1622-1-tiwai@suse.de>
References: <20250731064813.1622-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 8FBD11FB88
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

The HD-audio codec driver configs have been updated again since the
previous change.  Correct the types and add the missing kconfig items
for loongson default configs.

Fixes: 1d8dd982c409 ("ALSA: hda/realtek: Enable drivers as default")
Fixes: 81231ad173d8 ("ALSA: hda/hdmi: Enable drivers as default")
Cc: linux-mips@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

The changes are only in sound.git tree, so I'll pick up this there, too

 arch/mips/configs/loongson2k_defconfig | 1 +
 arch/mips/configs/loongson3_defconfig  | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/configs/loongson2k_defconfig b/arch/mips/configs/loongson2k_defconfig
index 4b7f914d01d0..b1b370a227dc 100644
--- a/arch/mips/configs/loongson2k_defconfig
+++ b/arch/mips/configs/loongson2k_defconfig
@@ -257,6 +257,7 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_SND_HDA_HWDEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
 CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_ALC269=y
 CONFIG_SND_HDA_CODEC_ANALOG=y
 CONFIG_SND_HDA_CODEC_SIGMATEL=y
 CONFIG_SND_HDA_CODEC_VIA=y
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 5ff0c1554168..b5c18d847908 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -292,11 +292,12 @@ CONFIG_SND_SEQ_DUMMY=m
 # CONFIG_SND_ISA is not set
 CONFIG_SND_HDA_INTEL=m
 CONFIG_SND_HDA_PATCH_LOADER=y
-CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_REALTEK=m
 CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
 CONFIG_SND_HDA_CODEC_ALC269=m
 CONFIG_SND_HDA_CODEC_SIGMATEL=m
 CONFIG_SND_HDA_CODEC_HDMI=m
+CONFIG_SND_HDA_CODEC_HDMI_GENERIC=m
 CONFIG_SND_HDA_CODEC_CONEXANT=m
 # CONFIG_SND_USB is not set
 CONFIG_HIDRAW=y
-- 
2.50.1


