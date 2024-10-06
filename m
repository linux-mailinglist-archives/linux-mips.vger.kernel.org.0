Return-Path: <linux-mips+bounces-5756-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A521C992049
	for <lists+linux-mips@lfdr.de>; Sun,  6 Oct 2024 20:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F9D8280C65
	for <lists+linux-mips@lfdr.de>; Sun,  6 Oct 2024 18:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F26418A925;
	Sun,  6 Oct 2024 18:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlT+hDLM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6732189B9B;
	Sun,  6 Oct 2024 18:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728238433; cv=none; b=EqhExEQKVrhi0uCgTJd7EAV7cZcJCHMqSuOw+infDpLp2abr44LbyU1+IfZMWzDCW5ChC8MmZ5e2HnhAju1NTYw/odvbR21z7lXRzGhejmczrc1NWDMdo4GFJ9nCcOvcXTVhtYWS3Vz4REKqTjdCte9ejIHaag9ShFmgIr2zF2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728238433; c=relaxed/simple;
	bh=5GYBDdiMONbyuYiRgqxSG4Ae8BnHVDrYlX0vuoOm6SA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tyJxKztqF8OKBUB72oQIBFfNRKqKbI9W0wvuG5kiXOo4npxXE9wOOabiEuvaq1lZL3eiIWzZT2UCbt+v5SseRMdj5LyS34aJGhx9M+3pPV/JgmAU6cLTnaR7CFiKRbG7bNH7YTrSmiJEW01OsVceqZARy3ou0wTtMZftLY5BeOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlT+hDLM; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fad8337aa4so40580681fa.0;
        Sun, 06 Oct 2024 11:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728238430; x=1728843230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+0aDeUkxFFBroldcgFLSy647qB7dRMBljbHVjMTQ28=;
        b=SlT+hDLMPGwQf1ks35paEUJiDsCRPlIT27xxZROsdtf3rOwxXBg+RWWQTyyTrYyl5j
         O8TJBXlOfmkODmmyZKqwVMr9Lvp/cOO7LzyaWQ4CVa7BF6dlnjNkAKD1j7IR+I0diLp+
         QMDsQdMiBPCb0Kz3RIeXOH5Xg8VuwB3JtJ8p8QAjppJiTnzddPHo5i+vEzK/KNn33syp
         fzwO/nmHCa0uA5SbNjr4A3m/IgKi1HnhaenBPSl+v06ak38WAbO5NyH4cuwdafvOG4A+
         sS8LiM+GC45gGgTxrLn4qAQ9I+rB2SRXAYqUufLO0zhpkEMDgMyxiO8cwlkDTxg8XpZK
         BV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728238430; x=1728843230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+0aDeUkxFFBroldcgFLSy647qB7dRMBljbHVjMTQ28=;
        b=o+zc/zHhbMU9Sv4b34JqLPvMAblpeeemzhPinef3kLojdaE+Kd5NTm3qE8zYJ7OuBF
         39k9/yvSAUzKB0qa7FTGQGtgDMuqB48J1dZgD8Ysqz1C2Gh8p7SnUaO8qLDqryvJ12Dc
         k7/Xqa7+zTNYbNkr5K0MdLitRWsbpnfNpsVx2eTFM6RojfVWWs+MzKqjZOyCtxVzTuMH
         qVBka/oxV84wDpLxLY7RbyMT+XyUyGyyTtDRVuXY/Cl/Ai7ty4TbN4VwfeZyW4TIRHPm
         Lz43pv6p6O/itufg2BBNbD9QaURZCahnqPwiu0KqIKnCnOPxz0Y8lqJoJ3ACBD3XNf8J
         b84g==
X-Forwarded-Encrypted: i=1; AJvYcCVet7Tl6q9Vf+c5VvM5ezwdOcEicbSOhF/3nn0c3UvGJITSekNJ3ifUc30H++ST6bSLcGfO0G+Io4mu@vger.kernel.org, AJvYcCVzr4M+SFkgjPy15pIgpey6fWJXl3JVbQ2EdLH2+HRBjxob6cDLrg13owZ+c1FkBthIuGq/djisOPA+QQ==@vger.kernel.org, AJvYcCXFT3H4i5tu4axltbkLVxWI8YgB+/l0NZjssnJyAW1VHueF3Q0fF+XQ8f44MXqD5TWPpWFCBWMvEz5P5TZt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0AHgxHnixc0hAopP7U6VVCc80tUDNK5RrIjda2gxdOuyfildQ
	CVqGAoGHhEyHx3MetVgTk1txc2i4Eap5blanRZePX5WB3GN8MZUy
X-Google-Smtp-Source: AGHT+IFTzg0EcnCGHqZqWxURFCnPx58FKCzQgB3Nyne+P7tfuQd2c0d73Dn1PxW3ZBqHfWlqhEHgaw==
X-Received: by 2002:a2e:9795:0:b0:2fa:ded3:f6aa with SMTP id 38308e7fff4ca-2faf3c1c2f6mr26486521fa.20.1728238429666;
        Sun, 06 Oct 2024 11:13:49 -0700 (PDT)
Received: from KILLINGMACHINE.itotolink.net ([46.188.27.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec8276sm590372e87.86.2024.10.06.11.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:13:49 -0700 (PDT)
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
Subject: [PATCH 0/1] pinctrl: ocelot: fix system hang on level based interrupts
Date: Sun,  6 Oct 2024 21:13:09 +0300
Message-Id: <20241006181310.181309-1-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've encountered the interrupt handle loop when using Jaguar VSC7448
chip with MAX3421, configured in level interrupt mode (default mode for
MAX3421). Upon connecting thumb drive to MAX3421, the system would
hang. After some investigation, I've traced the problem to the GPIO
interrupt controller code: by the time ocelot_irq_handler() is executed,
MAX3421 would clear its interrupt, subsequently lowering bit in GPIO
controller interrupt identify register. Because of this,
chained_irq_enter() would never be executed, and the parent interrupt
would never be cleared, resulting in a continuous interrupt handling
loop.

This could be fixed by clearing parent interrupt unconditionally, even
when no bits are set in interrupt identify registers.

Sergey Matsievskiy (1):
  pinctrl: ocelot: fix system hang on level based interrupts

 drivers/pinctrl/pinctrl-ocelot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.39.5


