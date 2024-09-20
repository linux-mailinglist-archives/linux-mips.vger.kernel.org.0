Return-Path: <linux-mips+bounces-5606-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7025297D20B
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 09:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0EEF1C225D1
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 07:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EFE5464B;
	Fri, 20 Sep 2024 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpVsbD/X"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905645FB8D;
	Fri, 20 Sep 2024 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726818793; cv=none; b=IJtdVtBzeRU8d6Hik3id1XAWYfncYl+gXQREGciJF2KsHNr9UubritAv1np7BV9Qy0oh6NFtfO0ahAa7FAV7PcFLNYW/38lDVdzkyG+L36HjtTbhiSlQ/gX5/OeHYLLJC+QRsOUo5VNxnoB42WcbIu2qQzkSyIZFag4GPyUhpDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726818793; c=relaxed/simple;
	bh=itRPv8fPWwKEzXw/sGyTx50kY065mhtH2xaxtH6OO0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kICEcMdGFCDaWdeyAjdCmvbT95WYwmQwihuaI9l1QTAH7jliJURCZE6ud4+Oy3w23ZzTSuju64rrf8uGVTIq6twz7vW5C6kpeppwvnm5wcYRkjmW8G/4O+hdnWEDJW7kGhakSnP+rfDDJwm12mhFQykrfiCxTxG6/m6DpGpsSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpVsbD/X; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so13691105e9.1;
        Fri, 20 Sep 2024 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726818789; x=1727423589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDSy81ysZ1UEoxb19rlu7ce7gjk4GzVsHjgio5NlUac=;
        b=KpVsbD/X8bDHHPTF44zN/p0vz9/4N3JlOTlAxidNnjiabTmQ31uqpDxayLFLe2Vf5T
         nsnHIz2uunmjMt5SFlPzNdVjSiuRBm6ZC2T4BHqBvirfTqh/1UhCdiHkEc77PXYDs0kX
         QuP5apFjSqqlD5xfK9CQSfMW5413USCjgVw8igFNuhPDca0y/UQZ0DWq+YeTvXVg6e84
         rVQyQbxWQt4HB0M7shRb+8XNPeCzAUM/dYkBRGRBbQGOHgYUgd2O77Fm9wwXLdQPnYQZ
         pIR+HeWmAOmFUTic3xhreiNDTgM49ocb6MkmaY+RTQjSOpdq4e+3jXqMFhDbtsktaI49
         wEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726818789; x=1727423589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDSy81ysZ1UEoxb19rlu7ce7gjk4GzVsHjgio5NlUac=;
        b=JDQwp7uxWHcnJflP0E12hXWVix+td2zkInaCZlsvpa/T7qlubRhjVNS/uf11kAKt4/
         r6FQWpPhLE/57xGDQ0vOUd01KP9qXug+RRtIK4SeFOjWSkmATIN4s5DjBBmBYIewubcp
         74spPT/cMtI0I1FwQbE6ZzeoUo9nsdUr3TRIPLc0Ie2vEegr92/Klv8ykUDTXXT0E9LE
         6GqACAQuhJ8imuq/ZvX5SY7M/abM3vSAsJt3J8rQQgl9+BJrUM+0BjLI/ZwcPBf6H9bx
         ZjZjO3QUm1lWjHVQn6i2ov2Z1es7MZs/9zlk+vrbUInK6/8SMAIq6/zdNNLJ/WIWbAJN
         x5+A==
X-Forwarded-Encrypted: i=1; AJvYcCUKH1hX3xqbR9vZwbLrRsn0NerqwyMaGQ2bTXuNJ+SNqfNKnMWyQKXpapX9ZgGYk0mdaCFijhIB4fRwlLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9PL8gVZYpNXgJnTih6Jp5fRaXH4UK+H3J1U2TJCy9jqFahtcq
	4WbbpzPL00BGLknnrzgvb7sYGfaIaB1bC3khtQCjpcDcwSiapg2NJF7Hzg==
X-Google-Smtp-Source: AGHT+IE6Ahrn5Jg9BHiWLhrdVICYWjCXjXuDOuBaLI6dKeeIERvlMg6X4NUs8zSsXKOf1ujtBuysRw==
X-Received: by 2002:a05:600c:1550:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-42e7ad8b143mr10446455e9.24.1726818789091;
        Fri, 20 Sep 2024 00:53:09 -0700 (PDT)
Received: from localhost.localdomain (201.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afbfbfbsm15178465e9.22.2024.09.20.00.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 00:53:08 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-mips@vger.kernel.org
Cc: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de,
	john@phrozen.org,
	linux-kernel@vger.kernel.org,
	yangshiji66@outlook.com
Subject: [PATCH 0/2] clocksource: move System Tick Counter from 'arch/mips/ralink'
Date: Fri, 20 Sep 2024 09:53:04 +0200
Message-Id: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daniel,

System Tick Counter is present in RT3352 and MT7620 Ralink SoCs. This driver has 
been in 'arch/mips/ralink' from the beggining and can be easily moved into a more
accurate place in 'drivers/clocksource' folder. This makes easier to enable it
for compile test targets as well as reduce LOC in architecture specific folders.
Bindings are already mainlined and can be located here [0].

Thanks in advance for your time.

Best regards,
   Sergio Paracuellos

[0]: https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/timer/ralink,cevt-systick.yaml

Sergio Paracuellos (2):
  clocksource: Add Ralink System Tick Counter driver
  MIPS: ralink: remove System Tick Counter driver

 arch/mips/ralink/Kconfig                              |  7 -------
 arch/mips/ralink/Makefile                             |  2 --
 drivers/clocksource/Kconfig                           | 10 ++++++++++
 drivers/clocksource/Makefile                          |  1 +
 .../clocksource/timer-ralink.c                        | 11 ++++-------
 5 files changed, 15 insertions(+), 16 deletions(-)
 rename arch/mips/ralink/cevt-rt3352.c => drivers/clocksource/timer-ralink.c (91%)

-- 
2.25.1


