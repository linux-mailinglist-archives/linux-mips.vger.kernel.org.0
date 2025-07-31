Return-Path: <linux-mips+bounces-9961-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAAB16E2D
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 11:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 944EA1C20491
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 09:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C56229E0EE;
	Thu, 31 Jul 2025 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gPKWYSIz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aHWDMz1I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gPKWYSIz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aHWDMz1I"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CABD291864
	for <linux-mips@vger.kernel.org>; Thu, 31 Jul 2025 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953076; cv=none; b=LxBNcIA1FLFYOe8qwrzVwBHEeAzJ71zO3C7yo07ESXQnnzgN7rlmRNM6fviWQZVWNPw8B5GZppgfbDfKcsXfW4tTAl7ZVIDOJ956FhBdhmnaQvEA1oBZjfPZ/lERA1UYwjxRpIrB1tzIBR1qGT0iI3icysowpssKIyTwBJRO+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953076; c=relaxed/simple;
	bh=J40L1OjWyYIBRewsl3dOKaJHM6uaAmKVGL3iGmBnKx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPAHccsdcRhWiZG9dg8YLXwT6l31xNm419FC+z4TvwXtRVonkGaxePGDLwGJXDX16+3yBX+3GGBOSzkd42sMMwTE9kgLi+0ZcyBAd6DQExABrJAz7Ub+/WofZ6Z8dR12Gxwp4jYl9wovyua1F+ZrRWD+1yzKFv2Uz9uFgE4eSIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gPKWYSIz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aHWDMz1I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gPKWYSIz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aHWDMz1I; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 83FBF1F38E;
	Thu, 31 Jul 2025 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753953072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GVmMkxb5rkYSM8Vf6O25+VMjqWVcCa6vSQdWNbqrHw=;
	b=gPKWYSIz4bAVjL6Pc5/F2beJjIoSPnLmVrARlwAemFFKk1JS6CV34eBOZtuVMg1c+MDduF
	xCabCcCsEsiUL/RTuAuhyDdFE9eNblPObrrWmUppz7iXDfQeAtDkoPCmiHgsHkbo9QQBsV
	T69wi+81makSBPsUgao19JuTUkZEslM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753953072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GVmMkxb5rkYSM8Vf6O25+VMjqWVcCa6vSQdWNbqrHw=;
	b=aHWDMz1Ildf2CfA5pJsNZWG4rUwhfMwMI4qbauhHEx6JtTnf5LreNMBY0B5OYWbtfXK7Af
	3/JCYYgkg8OeJKBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gPKWYSIz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aHWDMz1I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753953072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GVmMkxb5rkYSM8Vf6O25+VMjqWVcCa6vSQdWNbqrHw=;
	b=gPKWYSIz4bAVjL6Pc5/F2beJjIoSPnLmVrARlwAemFFKk1JS6CV34eBOZtuVMg1c+MDduF
	xCabCcCsEsiUL/RTuAuhyDdFE9eNblPObrrWmUppz7iXDfQeAtDkoPCmiHgsHkbo9QQBsV
	T69wi+81makSBPsUgao19JuTUkZEslM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753953072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GVmMkxb5rkYSM8Vf6O25+VMjqWVcCa6vSQdWNbqrHw=;
	b=aHWDMz1Ildf2CfA5pJsNZWG4rUwhfMwMI4qbauhHEx6JtTnf5LreNMBY0B5OYWbtfXK7Af
	3/JCYYgkg8OeJKBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51F4813AA9;
	Thu, 31 Jul 2025 09:11:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oJTgEjAzi2j6FQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Jul 2025 09:11:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 3/3] mips: Update HD-audio configs again
Date: Thu, 31 Jul 2025 11:11:07 +0200
Message-ID: <20250731091109.16901-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731091109.16901-1-tiwai@suse.de>
References: <20250731091109.16901-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 83FBF1F38E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

The HD-audio codec driver configs have been updated again since the
previous change.  Correct the types and enable all Realtek HD-audio
codecs for loongson, per request.

Fixes: 1d8dd982c409 ("ALSA: hda/realtek: Enable drivers as default")
Fixes: 81231ad173d8 ("ALSA: hda/hdmi: Enable drivers as default")
Cc: linux-mips@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: enable all Realtek codecs and most of HDMI codecs

The changes are only in sound.git tree, so I'll pick up this there, too

 arch/mips/configs/loongson2k_defconfig | 11 +++++++++++
 arch/mips/configs/loongson3_defconfig  | 15 ++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/mips/configs/loongson2k_defconfig b/arch/mips/configs/loongson2k_defconfig
index 4b7f914d01d0..7a86632b87e9 100644
--- a/arch/mips/configs/loongson2k_defconfig
+++ b/arch/mips/configs/loongson2k_defconfig
@@ -257,6 +257,17 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_SND_HDA_HWDEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
 CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_REALTEK_LIB=y
+CONFIG_SND_HDA_CODEC_ALC260=y
+CONFIG_SND_HDA_CODEC_ALC262=y
+CONFIG_SND_HDA_CODEC_ALC268=y
+CONFIG_SND_HDA_CODEC_ALC269=y
+CONFIG_SND_HDA_CODEC_ALC662=y
+CONFIG_SND_HDA_CODEC_ALC680=y
+CONFIG_SND_HDA_CODEC_ALC861=y
+CONFIG_SND_HDA_CODEC_ALC861VD=y
+CONFIG_SND_HDA_CODEC_ALC880=y
+CONFIG_SND_HDA_CODEC_ALC882=y
 CONFIG_SND_HDA_CODEC_ANALOG=y
 CONFIG_SND_HDA_CODEC_SIGMATEL=y
 CONFIG_SND_HDA_CODEC_VIA=y
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 5ff0c1554168..315ab7ec17b6 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -292,11 +292,24 @@ CONFIG_SND_SEQ_DUMMY=m
 # CONFIG_SND_ISA is not set
 CONFIG_SND_HDA_INTEL=m
 CONFIG_SND_HDA_PATCH_LOADER=y
-CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_CODEC_REALTEK=m
 CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
+CONFIG_SND_HDA_CODEC_ALC260=m
+CONFIG_SND_HDA_CODEC_ALC262=m
+CONFIG_SND_HDA_CODEC_ALC268=m
 CONFIG_SND_HDA_CODEC_ALC269=m
+CONFIG_SND_HDA_CODEC_ALC662=m
+CONFIG_SND_HDA_CODEC_ALC680=m
+CONFIG_SND_HDA_CODEC_ALC861=m
+CONFIG_SND_HDA_CODEC_ALC861VD=m
+CONFIG_SND_HDA_CODEC_ALC880=m
+CONFIG_SND_HDA_CODEC_ALC882=m
 CONFIG_SND_HDA_CODEC_SIGMATEL=m
 CONFIG_SND_HDA_CODEC_HDMI=m
+CONFIG_SND_HDA_CODEC_HDMI_GENERIC=m
+CONFIG_SND_HDA_CODEC_HDMI_INTEL=m
+CONFIG_SND_HDA_CODEC_HDMI_ATI=m
+CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=m
 CONFIG_SND_HDA_CODEC_CONEXANT=m
 # CONFIG_SND_USB is not set
 CONFIG_HIDRAW=y
-- 
2.50.1


