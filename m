Return-Path: <linux-mips+bounces-14235-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPRIN/Zz6WlbaAIAu9opvQ
	(envelope-from <linux-mips+bounces-14235-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 03:20:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8431044C186
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 03:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2EC530276A3
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 01:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793102820AC;
	Thu, 23 Apr 2026 01:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="fSpLf10e"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86D219303
	for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 01:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776907242; cv=none; b=SqiPhxvVAxN1EPLGZqFcXSFDeBt+AMO4SNKcZu9dptsfkUw6sPJaD8yo2BNEAa5mojcVwSFGbbtG9H8e9Z0QqGi+1dgXNT/lPLJtP10CAAtWC9Wousg0VUWms8dQeD0jjeNmtuzzSxo1OPmfe8z4c9Q7laF9S5t4/Jkg0bWNLcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776907242; c=relaxed/simple;
	bh=oK8/YyZlzxWNKx7QHqN2JUwOuHqd9lqaJ014pWskVOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oN+xeTTve4Aci9LMvkwB7YkVJObMtyCHP8ide5QigktrVF3EnUG4MufaPRK9HJXbC7S21MLpt1rSi1EowJaXfYHjXlAr8/IHKX60BapH2/t0uZ3JfuJYKW3gk83qCNied6EYBFqMNHhN1nlFdiJ0WudkZhrSXSuhXMeSdtjQkjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=fSpLf10e; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c8ccc7755so5492080c88.0
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2026 18:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776907239; x=1777512039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3wn1Bi8zHMHEE9lzFz36oYXmtJkWvnscqpI2VsHr4rQ=;
        b=fSpLf10egDgGjAfeHuP8lM/qxhX3S/a4cKfYLMBMzJ0U4kbNjZudPgsxsfbXOFZD4f
         Hh+dIC1f2kPxQbINqgKbOrbybfgPCvM7OGZs+R1B3+K/SxIKSW6Vrp0qf8e5JLh921cv
         cDVGOB36MeGr9QI9XQrOoLT7mSD+rUrkQ9wtsDzFIMfhZJt5SIrO5q09rU0kAX5cdt+6
         ZRHSp3LfvWEF39NlstwxbwVPN2HS0WDfK47zxYSUH59647IQCER/EzRQXiZFz0RZtURM
         G5xD8vtDT2dNJ1b0vGT1YXl/bB+qNs4liR+1FrRutIrYMLGXiOEhzbCD1LzIdLhawQfp
         zZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776907239; x=1777512039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wn1Bi8zHMHEE9lzFz36oYXmtJkWvnscqpI2VsHr4rQ=;
        b=LYsGUjgKhPAwRacKmjtMg9buX/lpiTNM63RCkqLJUt+viThsPmQjOLCaD4yJSbEa02
         GatWJDX9/cRMotj6+vJ6s+hqyj5FfkG5E1NszP4OaCotZop5HcJzE4+zGvKH4BSnVNQY
         kqBIpw6c+rPXqYhfEq/UCf8h/fU7V2xO4ZtrlqlteXYQGKCM9+jnraOPdJ968RnkGXVf
         RF6ECOb5yf9oKdsnlV5SvtYQrKMeVO1fyH7zPkobwO0oRb9fjzoXuOlLG7b9+p3JrbLS
         zSrhwz0fwKEaD5Jw23WORR9UAlwO/ebr41T/AZEJyi1ZQE+nR1DQ5WOxAYHVIadlAsKj
         PcaA==
X-Forwarded-Encrypted: i=1; AFNElJ/5vCN9VfsPmkXi6XfN1bftXvKhbquMy85vAKsN3u/651/e/VJOw2oQ+vzhSgcwguV6ns71s2k+BJ2/@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHZEwxDf/jGaNHPmJpKJ35QW5o7MYKKvMKFXiWO4+UbsHcvH+
	Smpz3BubEXHIKxJsVqDNTFM5c7TEVJsPG6fy/bAoS3ghKhXLzPceDnxaWDyvOy43bTs=
X-Gm-Gg: AeBDieuyyrfjNIecbzfXfDxGkLuKzsMATyR6ZNcURPFni7PNpY2gjvSsHQeBHcC+dVK
	45soTBQPD1bu7vqRMWU/qX26FDcO/hXr6JDsSJ4y+n1TUPhmJFT8YtsgVf68k4MBbQVYz2IaB9d
	Z1bxyUYC1s0CeZ0cAc4GYVQC3+qiU6Zq/vJwpMNLPGFUEMLFCw2rzxPYXXI36YTq4y97ZigHL4C
	tcUejcjv8FbYbmfDyUiCusTJSb92033DlSmIYfxEVmy0eQTlpuXwGoM08VKYMKM3txwgBrggh/V
	Sq34/BgFIwcFd3rDJSurFSRx0tjFQjrekFQ8ppE3Wt3a8Ams1Ed2NalNUQYsy3jwQPSwYjcU6Ir
	sLI1E0LgOkZiGr0qkfTuOfA/26pYsauRGNB1sSVMtvgmjx3Os+NdgaY5PuINBzIluC2jjBGTYZK
	2mkrhwU/Zq0VYDV/i82Krgdf09DDZBuLjNWy5ut8+rB448OA==
X-Received: by 2002:a05:7022:458d:b0:127:5c3d:bd95 with SMTP id a92af1059eb24-12c73fa2c95mr13683903c88.32.1776907238509;
        Wed, 22 Apr 2026 18:20:38 -0700 (PDT)
Received: from localhost.localdomain ([177.81.10.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm18139235c88.1.2026.04.22.18.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 18:20:37 -0700 (PDT)
From: Felipe Ribeiro de Souza <felipers@ime.usp.br>
To: andy@kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	nuno.sa@analog.com,
	paul@crapouillou.net
Cc: Felipe Ribeiro de Souza <felipers@ime.usp.br>,
	linux-iio@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v4 0/2] use guard()() to handle synchronisation
Date: Wed, 22 Apr 2026 22:18:29 -0300
Message-ID: <20260423012011.41001-1-felipers@ime.usp.br>
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
	TAGGED_FROM(0.00)[bounces-14235-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,usp.br:dkim]
X-Rspamd-Queue-Id: 8431044C186
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor ingenic_adc_read_chan_info_raw() and replace mutex_lock()
and mutex_unlock() calls with guard()() in drivers/iio/adc/ingenic-adc.c

Felipe Ribeiro de Souza (2):
  iio: adc: ingenic-adc: refactor ingenic_adc_read_chan_info_raw()
  iio: adc: ingenic-adc: use guard()() to handle synchronisation

 drivers/iio/adc/ingenic-adc.c | 56 +++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 26 deletions(-)

-- 
2.43.0


