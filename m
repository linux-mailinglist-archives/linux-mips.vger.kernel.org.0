Return-Path: <linux-mips+bounces-6000-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A4F99B336
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 12:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 009EF1C227E4
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2024 10:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7BE154449;
	Sat, 12 Oct 2024 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Obw11DBe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC951547D8;
	Sat, 12 Oct 2024 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728730694; cv=none; b=XRWtuXkaW3WzMz4Hyafwd2Xfk9auullUghVF6VIThrSQN0IDiWVWhYJiSG8P4zXO1U/0PI4c4KuBwaYzG1i7mKPOpVB/hid/Dawey3ClO2ULdzhWW7AsVy3XqlbBg5h29lzXp54ZS3l36vjDr/Mh2FxLKVLjqakq3etz1vO+v8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728730694; c=relaxed/simple;
	bh=cixX5jej+mgJt4Ts6jAxWhgvwdwkd3AU9ACP+3MD6N4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mKog4nIgcxra6MyQpVjr0bwPEHyzNWcMzH0GH07Y0VRZuFO6Bpj4mtYNSarCq0nKgdzjNg7llQnJp39JuZV1Bxk/p8YutPlw2+qcg6CLTwYo/nP2yXfIU6cAxGK2ylWfA3D86qHaM9cTfPDKeXK3nU82+VZ8qq2i7aYp3kvw1Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Obw11DBe; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539908f238fso3279447e87.2;
        Sat, 12 Oct 2024 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728730691; x=1729335491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YbXRgUrM1uKKdmbDc8VsEAxWIIskmgP+K6DDuK5uacM=;
        b=Obw11DBeEq6wb4YHg/pbi7grAAvFh6SvRyK9863os9RbPU+m1N/TcZkKFDxm7Qo8DF
         EJX9wqXRe/BznCzoCT98W8+aVJj2j7SeBr9xOUnpAkvRhEut4nD+/YKVO4a62r4se9eU
         +3fsFDZ1cvtGImGEgdQ7BhZXCkCO+vD9iH3CQCrcHEeFqlcauWIISOQWE1bcRcwWJYL2
         83jj5alOb9HFUSi3AY4KL14FpMFWR5TGDPjM7CtsMpKadlgWUIJo58zEXecHcnax0bCN
         Aga1jDJbZULbJGuB4PBHAjFobDqwd3sHDNZuO1RUrd7yfJ86/Vlnn7ifKw7GhngxCfah
         xlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728730691; x=1729335491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbXRgUrM1uKKdmbDc8VsEAxWIIskmgP+K6DDuK5uacM=;
        b=B+dnDN6Qh69E7Zza5Rio8HuwmGPQFd0C1M2x4c28uJdtWKVZ2eGAYTo0RzzH5t3ieN
         ZJw+2Z2Pw4uZw4Uh6Iu6wAExMepugYpzpKKx7fCzK1BHYFvC3yB2sPslBCZWBeyz9P8u
         EmU/pDiOzFW9pnGio7yT0paxGzdqzWVTU4LjPPPcfmVH74Xe5DEPuUQeDGITR6Z9YM+K
         N4BtQDOIqnL/jqgd9DIVnI/XDr7YwHZ4b837OeqEU+PjNmHlgRFkrSYLsf/FTuzMHNj7
         nu44XuvDq/LlSJx3BRDr0Iby0RpWJlziRIXVYOHw/RqV23wlO6RiFa55GMoGNhFT/zev
         ugEw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ul6LyXoV8MQB3ZqRHjYk4oTwBacnOBEgsDINLiH8OcBLWKKdWIOMXMAV9RhATJqDomhqtDJjfCBahw==@vger.kernel.org, AJvYcCUB0o4rxTHlcTA4TheT6e5n3zDcuiIEVNiDUE/979okvcg8qBV7C3HnVHmnRFtJp/b2QJkR1OsWgRY7yxot@vger.kernel.org, AJvYcCWgSUvXjvCCOzbn0gYtJsshkxJxB07d/y4dWjoS1jDZEi+idLHVM1gkE0lfiw1pu9QqwPqWwKAY0R8R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/OMjxeUCU44/z0+KI27Pa7x5o2UiJqMU+DSy1hs2A/AgM+hNh
	hs6W2UPoelI/SzYZd0dHsI3V5mF0+ijMLzXgN51BKqTAtCyJ/fHD
X-Google-Smtp-Source: AGHT+IFv74CjuViB4RF6imvDAxTAD/a4rCICKd0Oh54c2jJYfDT1WoeBeh5BhnHOE7dvkU9weXdP/Q==
X-Received: by 2002:a05:6512:3402:b0:536:a68e:86f0 with SMTP id 2adb3069b0e04-539e55142c8mr924346e87.27.1728730690661;
        Sat, 12 Oct 2024 03:58:10 -0700 (PDT)
Received: from KILLINGMACHINE.itotolink.net ([46.188.27.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e2a59408sm396944e87.206.2024.10.12.03.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 03:58:10 -0700 (PDT)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: linus.walleij@linaro.org
Cc: alexandre.belloni@bootlin.com,
	quentin.schulz@bootlin.com,
	lars.povlsen@microchip.com,
	horatiu.vultur@microchip.com,
	andriy.shevchenko@linux.intel.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	UNGLinuxDriver@microchip.com,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH v2 0/1] pinctrl: ocelot: fix system hang on level based interrupts
Date: Sat, 12 Oct 2024 13:57:42 +0300
Message-Id: <20241012105743.12450-1-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix system hang in case of GPIO pin interrupt configured in level mode
and the parent controller configured in edge mode.
Observed on Jaguar2 VSC7448 connected to MAX3421.

v2:
 - Change commit description
 - Add Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

v1:
Link: https://lore.kernel.org/linux-mips/20241006181310.181309-1-matsievskiysv@gmail.com/

Sergey Matsievskiy (1):
  pinctrl: ocelot: fix system hang on level based interrupts

 drivers/pinctrl/pinctrl-ocelot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.39.5


