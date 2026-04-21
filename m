Return-Path: <linux-mips+bounces-14220-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBIoEpf352kVDgIAu9opvQ
	(envelope-from <linux-mips+bounces-14220-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 00:17:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C8440165
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 00:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8A8F3027B40
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 22:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E582BD58A;
	Tue, 21 Apr 2026 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="iCV7v8z8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461A26B2DA
	for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 22:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809807; cv=none; b=hnXB2PXblVi2+eXVvhiHxV6WPiLN+KtXyNaGAidUN4nvAwCXfiaX8n6kwDYH5hdWzFUJZD6ANA2fT5vmR3MIB3FR0MTqFAQQWJto2ZcAcDCvG0pHeGU5EjdIAiqGWr2WQSW3PSQgULHsVpmju2WYN5MYSFf1SNwCThVT/A6QLGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809807; c=relaxed/simple;
	bh=E3qixZHGrY++BieqglXg/1nf9294x61CkBcRvMH5kMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oj204CWd/5y1ENIHyIbKAgix1agpAIOfJXxHFpbN9qcJDI9nkhojBi6lXryaafroeMhFOaB1NWcZTa/7iHGBMzwxZlsuEU+mRJN+zKWMiG4XHohjk43YzFMGeKjexItJKHQY2QXgdc4Y9k3829HxA33QSilJNdrHNeCPqD6prSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=iCV7v8z8; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so394482eec.0
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776809803; x=1777414603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ErF/smf1RGwYYSd5uAXQ5ZFI8FNotVeWrqMpZjXu4e8=;
        b=iCV7v8z8MvqKw/2f2O7Xt8O/KfX9m2WH2ov/+i8NhBjQapJxVzW5S3YZkJCRZeZmKj
         OoN2jJalJZEK9ojZo4Ufts/K9A/qgEOKsH4JGwSz/U+CpspNJp9hL56xY1mjp0Ek/fCZ
         qXRtJeH7keP4IDskdMpxevcuzMtJYj6sGFW1TkMlaSSZ3ib3XRCuhzyVgLCLJAgOBnv+
         Z2MYexN7Uq52/sa2L8NwWJfjbXFq/NkvD7UjKrwhK7KhBCAy5zr5A0XAChbRa/2A4MVl
         VMllS7DBPD6XWoROamEvNB5GprrIt7h7yBAqsIT4O+ZnoUWQvsJn4sulJmLOywcu/6Iz
         YvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776809803; x=1777414603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErF/smf1RGwYYSd5uAXQ5ZFI8FNotVeWrqMpZjXu4e8=;
        b=ZbUpCsBb7+CICN9cTtFDTDtAhQIboYLiDGzr2eQTwz+kWXIIMRtWFo/E6ltPl/Yj3B
         nvC230ez0ykpRKBcnbbsf7ND7HSXG33RvBmwq4gjMKjlYNO+umoV4T6Ep1TwFJxB5KRF
         ZwIrQgASXFje2qqmGuokt82H8rwCwnV0CuI4k63JQdMRSRLeY7JJdtXNlLJc39omGJcJ
         mI57XF9nt1mHBEN3FC3fVvVmgdpP9nM8VKsveMzAmh8hDxeueg/kz83yqv5vwW78ZecT
         QG6q9LDSi1NcRqLVxmE45eeUe/+ySKWl9N6boMvQVHefMk/1TBXBNPaOvm7H0/6uWjoR
         grYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AZCaNIro3ggByalU5XFoSQGJv/tX2lpHEjAuB4Awij+wm4Wq1SNECNh6sKKd3M7SyzXB0mfU3FuOp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbq2rFcVbciysj146XFBE8E54lqpm7WFSeaeHMWK7xZfKgAjTM
	ICFpDIn9jTlVTGkYE5U26cNnsT0wUMJcipqpOU+bJkKh/e0VNRTh4SsbTxhKJQ4rUME=
X-Gm-Gg: AeBDievXJecbxRjtActwBCh7UdIQBSNK0V5+Q6zz8f0kxqXvU2xxn+zgmjCViTR6BwB
	KTuR2rPl8AMEg+8dVAsJXusTHQ1OHXkwU2V3ZhBsYUL5QJknJK/55mCP/smBjFE1jJ4jyUky3Dk
	QwyZHiUWqLFRyHQv3yjwiwDh/I0xMKi16zRsKTndIVUpk4QrDUwMBRKXyfHdwA+otuYDNL0MWI1
	6g8vcIwMRM2PGyQ6SZKOXDogzA69clpVUphWM5CiBw8gAju65I0LcWgpEMn0X3XD/xPsiae/A7s
	3LTiK9QVAprRSjx9nD8KfGy3AwZ4/by1Fi3rous6yA0lGIPUsBaMhJ2ajhKCTgwylLJ+Z3cUAV+
	x+0fsz6KheIljc+XoxSukr1CePQioC3KfbOoIASro+m4g59a0uLH4IQtZ/DBAZTlQoLqtH2IZ50
	GtGP++uHny6PCfC528623Op90SG0RMlh9Tn+etQHEyrZybWtBvEIGmJDEWUfdqWor5lzkOlqYZV
	b2GxUo5/6Y4
X-Received: by 2002:a05:7300:5728:b0:2c7:ea98:da0 with SMTP id 5a478bee46e88-2e478a31b67mr11061672eec.19.1776809802953;
        Tue, 21 Apr 2026 15:16:42 -0700 (PDT)
Received: from felipe-ThinkPad-E14-Gen-4.. (201-92-135-6.dsl.telesp.net.br. [201.92.135.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfef3sm19827980eec.24.2026.04.21.15.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:16:42 -0700 (PDT)
From: Felipe Ribeiro de Souza <felipers@ime.usp.br>
To: andy@kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	nuno.sa@analog.com,
	paul@crapouillou.net
Cc: Felipe Ribeiro de Souza <felipers@ime.usp.br>,
	linux-iio@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v3 0/2] use guard()() to handle synchronisation
Date: Tue, 21 Apr 2026 19:14:57 -0300
Message-ID: <20260421221629.70401-1-felipers@ime.usp.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[usp.br,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14220-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felipers@ime.usp.br,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[usp.br:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ime.usp.br:mid]
X-Rspamd-Queue-Id: 999C8440165
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor ingenic_adc_read_chan_info_raw() and replace mutex_lock()
and mutex_unlock() calls with guard()() in drivers/iio/adc/ingenic-adc.c

Felipe Ribeiro de Souza (2):
  iio: adc: ingenic-adc: refactor ingenic_adc_read_chan_info_raw()
  iio: adc: ingenic-adc: use guard()() to handle synchronisation

 drivers/iio/adc/ingenic-adc.c | 57 +++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 26 deletions(-)

-- 
2.43.0


