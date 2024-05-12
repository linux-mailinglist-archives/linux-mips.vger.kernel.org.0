Return-Path: <linux-mips+bounces-3248-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0D38C36A9
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 15:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0C411C20F87
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 13:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D78F2556E;
	Sun, 12 May 2024 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVpxueMz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC17C8E1;
	Sun, 12 May 2024 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715520328; cv=none; b=liNn1m8ljTi+VZBJIp0rG2HN+U2/kxgyy36Foz2G88Dho5ICKKDkvq2ZrT/T9+1AJ1xHXLDwC5mI/FApceZ+s1cymmqlKsufMb1XGRaSVPug1bRmJWytuOa/jQgfthKWec9cczZlWRJNtkPTKhv3Q94wE1pZB8xW/xbPG9/H+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715520328; c=relaxed/simple;
	bh=ziuxodXmZqtpeLyT3WRo0HQ7ERm9YtUUFoZCGeXGEns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZiyw3NvI9MqmWxwRS5mfsDlLY188dYwQET54U8x3fy8gN4SRl/E9wsd3Q6Lgj0lKyDECqDcjHQnwLnr+47EF8qasWS0flwAjVHi92enDQjgzOpujKp8aHBGQ3cnFXFlUc1gncjRwUgi3FVZ0+8l0RxF93k83h29qdpDyiYf9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVpxueMz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34ddc9fe497so2147469f8f.3;
        Sun, 12 May 2024 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715520325; x=1716125125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sL/fOKJNE13f8s8Vxmy3Xn7MqVMQgv+JZ4dwjBfG/fg=;
        b=dVpxueMzVjzLUPpmy+QZ1BurCK+LoRkqSf6Dihmckx3lXiG5tiY2aVy3+nGzl2NSVL
         1ipI3muJWpZMoTuTYDoDi5y+oSCZ4O0sQizarKGZFTgDl9VSah5iogDbLr6LjtQTv4mD
         J8NVXZ2TvU7FTveB+P0hQG0cz40UrQJT/biXa8MlKxJmTTPVk2nvBl63MDi+gkxF7Tbb
         D3md4j+b1cQeAKJqYrHDNSYfz56GKaEyCrYTnV4/NyC7qWOHH7R+cPEQIgAWBq7O8pqi
         /rLdp4zuFKfyAhk1I+vZYX1F3+8saZcDv3/vYj1oROIMiFAenx8dYikjWx/Uz+Gn/THc
         Foww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715520325; x=1716125125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sL/fOKJNE13f8s8Vxmy3Xn7MqVMQgv+JZ4dwjBfG/fg=;
        b=cAc+T6XSBM/TABfz7wWtYadcRfls1YoXZBzclVjvp025uts2GP/jesGmJEPJ8frHZ3
         5ZEza0fCmeyLaTy4WqNOvyAmB0P4F1d1WDwf4maYOzu6NkJue0nT3Ajo9DI8iPYUljwU
         oeS099fXYZW/052Tp4FXkLbF+oCIoEH15x2ZjruwftZ388xfLP+S/GUHaobOe07k8ROo
         XvIfEZffzMBlSofUc82EiX0xhi9b/sXzl/xfeG4wERgcL7omk+pS3Wgdz9X6tPzg/4hE
         Bk/Izim/8yzHmUoW1oOs/YY1H3/nzqrwtKG0c2YALpUJ0yErDeNyWyh82Q/Ov/wS0dpL
         i0dw==
X-Forwarded-Encrypted: i=1; AJvYcCUj5xXDC/c5ez5O+VlQO2fhVs1r7NALOLDwttEZudMNRXc3ie9mKGDLYrDqqT942XkFGB9Rg9bIxutLSKvVRjkH42sXWp0vO5+nFAschnxZZeIdhYXDViMQ8x9OJd5Hi1FBzzFWkzayrVn2LJ7m2mPtx3X49HQoSh0Z7kIy/y6ufC3JYsc=
X-Gm-Message-State: AOJu0YxKqtWmSmzzYxPqVpoCMY6Atu6kqbCNFdfki5HVSOkKtXSsO3xA
	PNZcXBavQTjTYikTmjZ684ne9FU3vF1iI57bp8y+rl/h+eiL0Sas
X-Google-Smtp-Source: AGHT+IHRdHyZ3PlbbID/Gfd5cytQkO0BDMgpUZIJTDGo/+a9zih+tJjE0OnxVFh20DOAOFoJ351Fag==
X-Received: by 2002:a5d:4f91:0:b0:34c:fa17:f4fe with SMTP id ffacd0b85a97d-3504a632b42mr7190063f8f.21.1715520324938;
        Sun, 12 May 2024 06:25:24 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502b79bd09sm8822468f8f.14.2024.05.12.06.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 06:25:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Saravana Kannan <saravanak@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Baoquan He <bhe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Bauer <mail@david-bauer.net>,
	Liviu Dudau <liviu@dudau.co.uk>,
	Serge Semin <fancer.lancer@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/4] docs: dt: Document new bootargs chosen property
Date: Sun, 12 May 2024 15:25:08 +0200
Message-ID: <20240512132513.2831-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240512132513.2831-1-ansuelsmth@gmail.com>
References: <20240512132513.2831-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bootargs property might be overridden by bootloaders on kernel load,
in such scenario, bootargs-override might be used instead. With
bootargs-override set, any value set in bootargs will be ignored.

The bootargs-append can be used to append additional kernel arguments
to the bootargs property. This can be useful in the context of a
bootargs overridden by the bootloader that contains correct that but
the kernel require additional one to be correctly setup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/usage-model.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/usage-model.rst b/Documentation/devicetree/usage-model.rst
index 0717426856b2..885be3e582fc 100644
--- a/Documentation/devicetree/usage-model.rst
+++ b/Documentation/devicetree/usage-model.rst
@@ -217,6 +217,15 @@ On ARM, the function setup_machine_fdt() is responsible for early
 scanning of the device tree after selecting the correct machine_desc
 that supports the board.
 
+The bootargs property might be overridden by bootloaders on kernel load,
+in such scenario, bootargs-override might be used instead. With
+bootargs-override set, any value set in bootargs will be ignored.
+
+The bootargs-append can be used to append additional kernel arguments
+to the bootargs property. This can be useful in the context of a
+bootargs overridden by the bootloader that contains correct that but
+the kernel require additional one to be correctly setup.
+
 2.4 Device population
 ---------------------
 After the board has been identified, and after the early configuration data
-- 
2.43.0


