Return-Path: <linux-mips+bounces-12595-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BAACDDA67
	for <lists+linux-mips@lfdr.de>; Thu, 25 Dec 2025 11:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 787BA30021EB
	for <lists+linux-mips@lfdr.de>; Thu, 25 Dec 2025 10:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B0131985D;
	Thu, 25 Dec 2025 10:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbtRzZmj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC35314A83
	for <linux-mips@vger.kernel.org>; Thu, 25 Dec 2025 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766658378; cv=none; b=j4JcU+Rd4ltBpO7tAPwRsLGxxD3uK5Me8swsSAZKaKcZwAnDZwkLTZJOnkjJg9CIBsNRc70HAv+wApdC+blPU49MDLG5KbMpznbA5byCwKANjOsgNQUmDv2hQe8PUgZqzhOVS/8t8npmvfHzgTXCo42KfEWT53XiwZGxIkPeP40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766658378; c=relaxed/simple;
	bh=SskP52viYAiPHMk+t2yoCn8PRqn+AvUQds8WzbQsWwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ddDD9O0xMiYy6FNAkzcuLbUGHOpcK5cNikCplfDEb62tUNNt+LK2lQK9GrT7aXH9Aw2HhctSONH74H+uMrCjdqpzOhIAkGylDxNB81UxTUaAcUuPTB6rWQWhCWqaylQJHz0hUILdKSnZAHJrz74LiY7zXhf2yKIXwK1AbMi31KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbtRzZmj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b832c65124cso48758866b.0
        for <linux-mips@vger.kernel.org>; Thu, 25 Dec 2025 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766658374; x=1767263174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GU0KhzuEHH4lhNRVWa2X41dhcyghoa/RGYWJsiR27yY=;
        b=dbtRzZmjX8JaIwkWPRQwHbxkB2/cz0rO85GroudlHicNJHFhVsOV0qWtdrKymBYLo9
         2mLGRA4CaSQMYbgBsbhrHDsrqNbZCRQfq3vM7HQGfmm3koNu/jfMImoY7l7U+hactA41
         0H2g66+q8+C5E8sgy+udO4Sc/m7sWwYOvI/dUu3mjEfzCF+X3ettMcz2Ef+gEpFP9rxR
         IhYNHzhHQQ6jVQHTh4i5pAQRH9qGseBymsVFLMTRIwg0VoN25r9MZpnSmVhJif5UczXB
         6MmWaRfsfycnTikvrx8d0AMOwCrndmO2sT2SY/6xZQ8EtZSYO27QPscz06Fgx80g04zz
         ipGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766658374; x=1767263174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU0KhzuEHH4lhNRVWa2X41dhcyghoa/RGYWJsiR27yY=;
        b=cXY/dzWYsTIjXxN/EaaSLyOfCuk6+/IpnmqPRptFX5GtfK+N7zofu9rb+M967XZGhs
         1PCl6CJXS41Q3y6PFd4MAqgLHkRX9Dj3BXsu2WiX+X3azKzkA+bRbwTz4nU4hfcvdkBw
         JSlbZVM4LfTWNK+rU33qHfpXQv3kOqYksHZ4P7Ql3r/vpdyJAuF0ZvkPLodA2rjWfpOP
         Ft1/yDFEm4QtupQtsz1gDaTA3w4dV/n5ScHrgKT9A7Zr0zgElZmT2WGUxKQTLOCE2AVq
         HmnP7FgnkuvC9soMw0JhLao2ngoMRy55WUIdkkrydqcV82ag5+L69l8LrlV66rCZjXI9
         tLGA==
X-Forwarded-Encrypted: i=1; AJvYcCUpgSmXabVMLC+ZRxXvxpBzrPxY3KiUKoHXNp4MDK7fU2R5LGDr0SZXr+uA60BCRjM2GdCKtI7VrMF/@vger.kernel.org
X-Gm-Message-State: AOJu0YyOjx56wY2YtxGRuO8Pjy7s6YwkD65IHTC5wuUeV9L3ROlVCWlq
	OaMUyQ14LpLu7KlPtAImqhwPBf9Q9bvWERSDHa427phXxOAFQjxgBjFm
X-Gm-Gg: AY/fxX7nG6j/Wz7ByXaizn/kUz1rvyeZ0k9K/M0SjIiex6z1qNbtgtJfTOas+6iKB2i
	19fsMgGXoDbkAjpnzoekyMy1M1I9Ep3voNYJ/7Ipx4nb0GGXI/X5+ojG5SdJkrX/cCHZRMLOja4
	eUOpIiBJc0wJAGkKQFtmNoEFqe1nPyrIK0KnFaswz/RiwJQfX97zHRFyFBI7HQLTbzRcAJ9Gtsd
	kjs6eoZm506Fa8SY4IWYbXcYe8RfSmBpT/ClPwVc13KJKIIKVl5fdlm6qXgy5LSNu3kDPg7At70
	6DuLKfSkcjmUgDcDRWcx6PVT1wsBOKlBI4On/XBrOsM21pGs/gojE4Wo6BgQ6GOWAWGVReahDci
	n1bCVT5EGAy0hy8rZccA3uS9b+Kypm54cV0laGXGtlAnEddtbWKlqonFSE6UUZ5fmARzrWQU3Bo
	tTTq3Ogf+cs9ZKkiCcFTSTSJjO0DQm30N6lnyMPeJWNbAi4MAcWQeapYCw4bNAiva0jlc=
X-Google-Smtp-Source: AGHT+IGNgfPbdGBV4OsErCl8w1/y2EjJW2lfmR2JyTl+ckx6GipUwr/AyVUz9oTZgzcfzvxDxGdNrQ==
X-Received: by 2002:a17:906:ee8e:b0:b83:2c51:bc36 with SMTP id a640c23a62f3a-b832c520299mr120919366b.3.1766658374259;
        Thu, 25 Dec 2025 02:26:14 -0800 (PST)
Received: from localhost (dslb-002-205-018-238.002.205.pools.vodafone-ip.de. [2.205.18.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm2055396766b.62.2025.12.25.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 02:26:13 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 0/4] mips: bmips: fix brcm,spi-bcm-qspi devicetree usage
Date: Thu, 25 Dec 2025 11:25:29 +0100
Message-ID: <20251225102533.30772-1-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently running dtbs_check for BMIPS produces a lot of warnings. Start
addressing those by cleaning up the {q,m}spi nodes:

* allow the in-use hif_mspi as alternative register name
* fix compatible order from most to least specific
* reorder interrupt names matching the binding
* reorder register names matching the binding

This fixes all warnings issues by dtbs_check for the {q,m}spi nodes
themselves, and reduces the total amount of warnings generated from 416
to 368. I plan to address more in subsequent submissions.

No functional changes intended (I can't test them, since I don't have
any BCM7XXX boards at hand).

Jonas Gorski (4):
  dt-bindings: brcm,spi-bcm-qspi: allow hif_mspi as alternative for mspi
  mips: bmips: dts: fix {m,q}spi compatible order
  mips: bmips: dts: fix qspi interrupt order
  mips: bmips: dts: fix qspi register order

 .../bindings/spi/brcm,spi-bcm-qspi.yaml       |  2 +-
 arch/mips/boot/dts/brcm/bcm7125.dtsi          | 22 +++++++++----------
 arch/mips/boot/dts/brcm/bcm7346.dtsi          | 22 +++++++++----------
 arch/mips/boot/dts/brcm/bcm7358.dtsi          | 22 +++++++++----------
 arch/mips/boot/dts/brcm/bcm7360.dtsi          | 22 +++++++++----------
 arch/mips/boot/dts/brcm/bcm7362.dtsi          | 22 +++++++++----------
 arch/mips/boot/dts/brcm/bcm7420.dtsi          | 22 +++++++++----------
 arch/mips/boot/dts/brcm/bcm7425.dtsi          | 22 +++++++++----------
 arch/mips/boot/dts/brcm/bcm7435.dtsi          | 22 +++++++++----------
 9 files changed, 89 insertions(+), 89 deletions(-)

-- 
2.43.0


