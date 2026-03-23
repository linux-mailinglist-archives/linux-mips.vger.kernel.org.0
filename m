Return-Path: <linux-mips+bounces-13888-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPzmKpFswWkVTAQAu9opvQ
	(envelope-from <linux-mips+bounces-13888-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 17:38:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE17C2F8819
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 17:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6EF73068D88
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 16:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D8F3B95FD;
	Mon, 23 Mar 2026 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P72cE4aS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937623BED28
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282593; cv=none; b=LROBdJsOHPp7f64NvnZgiBOb34c9cT9qWfougsU5BDiZi3dasax4JZopq/fnrHYXDZjxoi1nKueB6Pw0a27amnhetTlBO1jrvpafl90sACvGbSytbtHGTLghaJ1I1xFBivSUBnob2iEmdyPwZHBK+IFRJhZ3tpS6Rub50U6ARdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282593; c=relaxed/simple;
	bh=9ZoDEUNK1UMn71bdmlD7rF6vYQmryeC4ixDQvdpmolI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3+01COf5b6+0pNCY21U/Hp0UVRzk6nuw2NlvU6oQDGqWaGIqN6M+QX6kRbmpUNicvBgNYDy4eEMU6fu3s956bzcvnkXC0vO13qoWr/qU27a7BPR0IdTzHm6wm34qxFcSn5nknzW6351Zy2OIbArhYchDKFabeCJGB53MfLO0jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P72cE4aS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so3695016f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774282589; x=1774887389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMcT6iTJXR0JLgXJbiUjGGM3dMly/KE9uQn9rqHqjyY=;
        b=P72cE4aSWHGIBwlgITo3Jv4QS2TDCZ+uM8LLDTYCLlCvsnmETOKnkpjkFOzOPqZFeJ
         lirhg+zk0pfvmVndDsK1wowIqato946eOzv/C/nCXL2L8i2XcwqG42PmKrAhu2ozy5Du
         p2mkmfld2Pe3WbbXanfb3qQVCxebV0T7ZpZahO6yA175FmYYYy6vghStfbV69LYnK0oi
         KWWCY/oo+y0DOYPmLRJAlXt6S6mOQF2y/G90Hg0lUQvs4LzpGX7cxcrcGB3q3pscF3Bk
         BJAqFDQ8Gez+w0qex0T7oyVjkvQChkEh3bGbNW5G62TDTWa7eH3AXuiCnoCVChn7tpuK
         5gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282589; x=1774887389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMcT6iTJXR0JLgXJbiUjGGM3dMly/KE9uQn9rqHqjyY=;
        b=YrMgaVWLALgNnHJLl4gzGjN8tMuzdc9TYoCmmzbxVAAh5QGT0jqmfr0BSvgraMqTMk
         EtP0LeQsP0caixYbjBP/z6qmPkHlylUj2eeswjVlC/Bg62ITIr/Y4WB7gm1XgxxckQEo
         5dVHp9AeLAqTHpovKsLaah/y/a1c4xQq7daXoeFZhYEoPCWJ8tJhvAhi0RGi7NL112Ks
         PKaWLKPjZo989Bj0nofckNYct7UE7xTT9bnPdau0SRW7529+FPJgZaHOBd8Eso6czGKq
         3WYq8M1IJ/nN5b5SZRA0LopySSrJExwil52EAHisYBopA+rP8mx7UUluIznHT7KV1SC3
         eSGA==
X-Forwarded-Encrypted: i=1; AJvYcCUyeFU4irNGUTMrm20bBBKNkfzfhvLF+30D25vHt58wMrcj4y40efqtlBYliTG+EHozWdryr60wjN76@vger.kernel.org
X-Gm-Message-State: AOJu0YxG1arZmisfXFi39Uj8ZKSLD5EIdCPYywoED6Hyajd5of/AGLZ5
	Wd102aw4XLW4kOF6T/CmdxEWUOsll1H0GHozRE9PcgQpQWtrukGsT/0=
X-Gm-Gg: ATEYQzwBAlgUYbKddTUip72HlgUUG/4Loq5RCegRY8dPO3IU81bedqEP9avRojfcug7
	+eJCRruaa3GMDxte2Z9586IkQ25tBOkm5o388B+7czHZw85uDEvKt5c/1MPuHDXXEVv0FbXFULL
	vEhDbDTx2Cz/7c7+qRLysidGEHv7Md1qmeNnxnIM66R/64/578Fm7GRFDYz74J/py68bszGzshk
	QSnt3qZ8aPXNcWXcGT2RAHuSIqidXEru33m4XRzPnqWPYdMDic2m8kHV+z/L7tHs+SpPQMsQhTT
	WxQVcEmqdo//VnSei13yemrCLGAvJXO+rGdRbTUBJ4T+xNaowr5LG7P3CtYv/PxCLlMheTDgX91
	C+XYrnWnV9aXPW1pAir3cKmO7QDNy7Hmftg3pr1ws3PuNDKzxeG3k2pZ6IyWQo8olyNgweoKeO2
	LQFFWaGY1qt7F5uHbfr68YoqOLNM1OBZ9z4Z0HhazDBA==
X-Received: by 2002:a05:600c:4349:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-4870f1fc613mr1615995e9.7.1774282588752;
        Mon, 23 Mar 2026 09:16:28 -0700 (PDT)
Received: from localhost.localdomain ([78.240.51.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm331863395e9.0.2026.03.23.09.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:16:26 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: paul@crapouillou.net,
	linux-mips@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 0/3] ASoC: jz47xx: Convert to devm_clk_get_enabled()
Date: Mon, 23 Mar 2026 17:15:48 +0100
Message-ID: <20260323161551.47181-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13888-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jihedchaibidev@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AE17C2F8819
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The jz4725b, jz4760 and jz4770 Ingenic codec drivers all share the same
clock management pattern: the clock is obtained with devm_clk_get() in
the platform probe, then manually enabled in the component probe and
disabled in the component remove. The clk_prepare_enable() call in the
component probe is unchecked, meaning clock enable failures are silently
ignored and can lead to register access on unpowered hardware.

This series converts all three drivers to devm_clk_get_enabled(), which
combines the get, prepare and enable steps and ties the clock lifetime to
the device via devres. The now-redundant component remove callbacks and
the struct clk pointers in the private structs are removed.

Jihed Chaibi (3):
  ASoC: jz4725b: Convert to devm_clk_get_enabled()
  ASoC: jz4760: Convert to devm_clk_get_enabled()
  ASoC: jz4770: Convert to devm_clk_get_enabled()

 sound/soc/codecs/jz4725b.c | 18 ++++--------------
 sound/soc/codecs/jz4760.c  | 20 ++++----------------
 sound/soc/codecs/jz4770.c  | 20 ++++----------------
 3 files changed, 12 insertions(+), 46 deletions(-)

-- 
2.47.3


