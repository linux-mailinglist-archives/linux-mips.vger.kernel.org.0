Return-Path: <linux-mips+bounces-9814-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA86FB053C6
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 09:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B41AC3A8ACC
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jul 2025 07:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BDE274670;
	Tue, 15 Jul 2025 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kZ/Uclzf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6QZLQBM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kZ/Uclzf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6QZLQBM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8EF274648
	for <linux-mips@vger.kernel.org>; Tue, 15 Jul 2025 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752565971; cv=none; b=HqfAR1gJy1o3NbZwyFlP+GB96Fmtxo6v8RzFSNGEDyM+YokIVsQFbur5DWFHOkhOFL46m3fecfOmNZCmVhA2mMREmQHaF+WE8r9HkwDESYW+jv/tkYESHknREmHkrvvH3PxC41TBV5tfn20+7Fw2EhtKKPfOKARpgIQ3gypDpho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752565971; c=relaxed/simple;
	bh=T/EjZ9oUuOHXum6/uLpaZNk7EMeaFk8/vHLZlCNIUdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmQW5PrNsa+WZy8lsJLm11r9nYc532YxpwkrfWUY6fyd098uI22TcGDAbqUjofJmlxJ7hDDVz11tI979j1ycjxyarebFqm5e+34liWqxgV65jDTEZnmClCcH1ckE34DZZ7pQLJp5Se+lu1WQF7QaJvsJxjh0wVKQHZjzKUJyfms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kZ/Uclzf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E6QZLQBM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kZ/Uclzf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E6QZLQBM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5AB6321245;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=102czK2bX3cmqlSriVXsJ2M0mtJ3UQcTGi9fuVH3TZI=;
	b=kZ/UclzfjvwSMWC1ieUIfNIBUv1PXi9uLsAsz1QqFi7H3drNqIwxZpSu0DqVWL3EEbsk/5
	KoQ8RAidcHC801777sqHTIaxXRYev/9YGk6WzPauwmEkbtGkQZjWojzJii20tb+dDvt1Q1
	dN1Xa+S7uEB+PwFVRewKt2b/NVBALQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=102czK2bX3cmqlSriVXsJ2M0mtJ3UQcTGi9fuVH3TZI=;
	b=E6QZLQBM38B5BJa1LG6Argk5RQluHRvajhaIAaujVkj2UsTH89Zi3Bt0tmPWuqtVXKEChg
	7n6XF4k/PbdZfQCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=102czK2bX3cmqlSriVXsJ2M0mtJ3UQcTGi9fuVH3TZI=;
	b=kZ/UclzfjvwSMWC1ieUIfNIBUv1PXi9uLsAsz1QqFi7H3drNqIwxZpSu0DqVWL3EEbsk/5
	KoQ8RAidcHC801777sqHTIaxXRYev/9YGk6WzPauwmEkbtGkQZjWojzJii20tb+dDvt1Q1
	dN1Xa+S7uEB+PwFVRewKt2b/NVBALQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=102czK2bX3cmqlSriVXsJ2M0mtJ3UQcTGi9fuVH3TZI=;
	b=E6QZLQBM38B5BJa1LG6Argk5RQluHRvajhaIAaujVkj2UsTH89Zi3Bt0tmPWuqtVXKEChg
	7n6XF4k/PbdZfQCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1287713A68;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nfH5AsoIdmjnSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Jul 2025 07:52:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fix HD-audio default kconfigs in arm and mips
Date: Tue, 15 Jul 2025 09:51:20 +0200
Message-ID: <20250715075237.28476-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The upcoming reorganization of HD-audio drivers for 6.17 kernel broght
some changes in Kconfig, and we need to update the default kconfigs in
arm and mips to follow that.

It's for-next branch of sound git tree, to be included in 6.17
kernel.


Takashi

===

Takashi Iwai (2):
  arm: multi_v7_defconfig: Update HD-audio configs
  mips: loongson3_defconfig: Update HD-audio configs

 arch/arm/configs/multi_v7_defconfig   | 5 ++++-
 arch/mips/configs/loongson3_defconfig | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.50.1


