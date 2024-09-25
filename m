Return-Path: <linux-mips+bounces-5652-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EAD986678
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 20:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9BEF1C23B4C
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 18:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C446F13BC11;
	Wed, 25 Sep 2024 18:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avQ+N2cG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0856613CA9C;
	Wed, 25 Sep 2024 18:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727289870; cv=none; b=l9ROQq70Siox+FkD1StSptVGi2/0vmn1yy/EY+Jxe+iQjx1WsQ0aq9y9jiyMBcY263AsT8z7bZIlqYPvnu3waz8hdiB4KsjY6zdhMxJaxqLrZ3WmmsLimPLAcVn+y81HQxGlvCNcSJBAMzTtbJfQVzF1VdKCM2jAvzGpWamKnMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727289870; c=relaxed/simple;
	bh=9YoJiMBcmTQC35we/cUzfdddFE/WrYSfUfTH2PWaq1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DarK6vOhwwVz3xRUCn+N+6iwR/3Fu+YmE7VI7uY+K3UOMA9nUoPB3eZHqOVaUbzIWmrw/yhnOm2z8gTKoxURrAm09N9gzUd/EhqXlgHYeoUl1Se9o6x+w6WDWdNdam+MPLvxFRjKPhChPBMwl07SlA8CB6sPyzcOacUh2xniNfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avQ+N2cG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5356bb55224so251230e87.0;
        Wed, 25 Sep 2024 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727289867; x=1727894667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ixom/aKlpRJXCoTV75uBWf1jgcI9pstSPM5zfdYoRzc=;
        b=avQ+N2cGIqdUHoDjiD7t+CAS/FhME+tikWJkzO929MNgXtSGeT3gkYYotBfl6b5u92
         lOhcIUYfqGQDHzlM0MjiJbCRIdpTlWZ/r2KkMVVI6SX7fOe8Mh/GOZrVAC9P1s+c2+Rn
         JQ5arBqww13a1CG0PD7/On8G7rRIDoWa5+E9XqxBUp1jKyqnkQtl4oDcik7keRLOsIVr
         wXIgB1/5BR4ImU+1C1eaH6gF71zg3Sm0mdthnGlWXISNtZ4fpIyy7hgyjjmsJftV/+OB
         69mV71yTgaWdq5DRydyHH2sCbJqXDj1DRW8ow7lyOy/z9VTrxsqfjbE1hzPiDS9ZVXVi
         pdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727289867; x=1727894667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ixom/aKlpRJXCoTV75uBWf1jgcI9pstSPM5zfdYoRzc=;
        b=krGsfWMEqC/m77Y8+SnMf+hF/3wP5pV3S9EYt6hfvdJuCXFIc6yOLLn8zvpLE9vdev
         s+8eqJkELGoVmVRtjIRL2QmxhNk3K3jY+/2ZjaG24h8E5U5pADYK3Z3Y1m4d8G/yvHQM
         0+sT/aOddsNNUY52gQHk65Am964fsbUeD6OJdGi9uKXvlWU5GivhxE2ylwNnQGHUd2sv
         2eZ0CO2OwHFU0TZzBXXefgGfJgmPSKDRGwT9cR5H1iBrxTmQdCVAM8YkQ2+jnkSQuOF7
         u+Jtmdcy4s4Pt4/wiC0ok0yqFMzhqzWQk3hl1mOTzBPOTKXekFjufEgO/lFdQqZgr3Gh
         kwgg==
X-Forwarded-Encrypted: i=1; AJvYcCWThdSHNoPFvsdFV5jKU36jN1Ov4wHNaC6uVrztw37xhPc6cTwQW/u1QK9MFvv5u9qrDaj9oBED3EJylg==@vger.kernel.org, AJvYcCWnAP2M9X3CF97BwYWPIirTMRLSvhO2BwJLPR8/T6vIdyQBmbH4LP9ZFK4RbCK0JURFSaER65uGvCzbzbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkIAiewS5gx4d2bedn5cpXnlWzZQC63hwvotdnI9ouj+76rc7/
	ZYLT2yXnxzNUtGrwxezsKHR+qFw4DGu7cSzC1eBXSQwdZ25zC9I3
X-Google-Smtp-Source: AGHT+IExZ1skYIwvLcmrf9++62GKSMUXmZ9FVN01T+tqQTYEY6sQ9TzfvRqTZGZHEVtCLudWerczeg==
X-Received: by 2002:a05:6512:3404:b0:52e:76d5:9504 with SMTP id 2adb3069b0e04-5387048b006mr2699683e87.3.1727289866856;
        Wed, 25 Sep 2024 11:44:26 -0700 (PDT)
Received: from KILLINGMACHINE.itotolink.net ([46.188.27.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8640a63sm588747e87.156.2024.09.25.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 11:44:26 -0700 (PDT)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	alexandre.belloni@bootlin.com,
	gregory.clement@bootlin.com,
	lars.povlsen@microchip.com,
	UNGLinuxDriver@microchip.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH 0/2] irqchip/ocelot: Fix trigger register address
Date: Wed, 25 Sep 2024 21:44:14 +0300
Message-Id: <20240925184416.54204-1-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use main interrupt trigger registers instead of device interrupt trigger
registers.

Controllers, supported by this driver, have two sets of registers:
* (main) interrupt registers control peripheral interrupt sources;
* device interrupt registers configure per-device (network interface)
interrupts and act as an extra stage before the main interrupt registers.

In the driver unmask code, device trigger registers are used in the mask
calculation of the main interrupt sticky register, mixing two kinds of
registers.
This mix up does not manifest itself because the current implementation
only uses level interrupts, but will be evident with addition of the edge
interrupts. The first patch fixes this mix up.

Second patch adds the comment to the sticky bit clearing code as it's not
immediately obvious why Serval family is not handled specially, even though
it has only one interrupt trigger register replication.

Interrupt controller behavior was tested on Jaguar2C VSC7448.

Sergey Matsievskiy (2):
  irqchip/ocelot: Fix trigger register address
  irqchip/ocelot: Comment sticky register clearing code

 drivers/irqchip/irq-mscc-ocelot.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.39.2


