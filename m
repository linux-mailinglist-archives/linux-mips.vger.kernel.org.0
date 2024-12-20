Return-Path: <linux-mips+bounces-7115-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6F9F96B2
	for <lists+linux-mips@lfdr.de>; Fri, 20 Dec 2024 17:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0ED1886460
	for <lists+linux-mips@lfdr.de>; Fri, 20 Dec 2024 16:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A67219EAD;
	Fri, 20 Dec 2024 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YlsGdUet"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53926218EAC
	for <linux-mips@vger.kernel.org>; Fri, 20 Dec 2024 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734712737; cv=none; b=SJuG3YO13Ow2PM5eJymo6T8DtBUG3rZCIwsHT0XRJ479hCkP7aBO8pGXINfmLNgttlN6O7sw85ES4j11mdkXb/7Dh6VrdOqjKjFtt/j9cU+ycFDpLMwzwo2N6jRHtbRr2CECvO9up1g0hnO9uwQMaKuJBRkarU14VTNvCe+3G6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734712737; c=relaxed/simple;
	bh=xJSwMwfXea0BCApufwp6R9Atd5xVKXp/cphPRHQEwpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XpunJWAvAvRdV5qOAHGNuyk+yWsynihn4i1FhjGcStkhLIcKXsHW6VgppliXKZmDKw1bQKrQ39nwXDse1KDvIl6ErgeaA32wbHAbjDQQIacgY6bAaYbY5Ni5X1xy8W9dEHBhnggp5jF4089jQiEStZ4La7j2XoxKlZjW7s7EgVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YlsGdUet; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385de59c1a0so1393091f8f.2
        for <linux-mips@vger.kernel.org>; Fri, 20 Dec 2024 08:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734712733; x=1735317533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMjaxIrXAl8+D23U0gHcM2nCzHZSoXq/gNYNvPuquzk=;
        b=YlsGdUetpCBUXcV81RzSgF38fkwpyi6q0Bx45rjn14jcwVOyf4yRyuJnHNEKhJJs5A
         qGl17v9W5b9hJ5fhAnyNkcLV9N2MuBgPJnt6icSRgZnXo9XBaH7DHWPa0FugnjZIjcUt
         WU+XUkMJ2IvpCD0EA3+lnyV09Wl5wzdGUj4FA7YMtFSCSYd2tprQdfZTYdpEBoRgQ9sP
         7CkeKiocjllZ6xadqEoKmsQga7RyH1g4bkPlVviy9JqPxGtVPCydQW0oTPHKzHWa4t2d
         hFobXzYdElWwoNmsicQITLowtFoSEv9J5jsw+PLTdp2GI0EfxqfYL8lI3SolCLQhCOHD
         G1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734712733; x=1735317533;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMjaxIrXAl8+D23U0gHcM2nCzHZSoXq/gNYNvPuquzk=;
        b=vDbCvA7M+eBdQYF2oxu1zVou6XhV0qZQTI+RTqJkSCqPzOHGW1kdh6PRARiWup/erK
         Mk2f/5cOLRClvFuTGySoJXZxW8v9700z/StZtnSK48y9xwDK6Bo6FwGbSLko3wt/t1vN
         QyN2DbxMSbFNkkY5Tqov2dDycRMdbQ/pCg8hN1rO1v7DiU1dbDDnyHBDIdtXuc+zMDGO
         yslnJtCwQTsbsnkzuDRZMEBtHLxaiIhZ9/c2KDURMcleKq2c9r4NoZvhjROn5aKc9gCQ
         YW/OJ7CmqhiHwCvuyYrh/nsqyt/+YF4ApICvEKRz5Hz3vevmvRGALjonXnMRJEn6GESD
         vDdw==
X-Forwarded-Encrypted: i=1; AJvYcCUADp0YlhgTNJnxLFfUEwaQoDsPZvVjds4RvX1Cra0SYezgiqBh6KQsrW9+OlzCm44zuedGOIdLS6o/@vger.kernel.org
X-Gm-Message-State: AOJu0YwiiM57/3lIeYN8cAWrZn3uoCajnmZA+xnNntzWt/RJXHer8lDE
	nG2rBG9CDX+Au1W4hSOBbom0osjTuVb7yH0iKkqYDlu9nDzsmH5944jDBXTItQk=
X-Gm-Gg: ASbGncsNJ0VyQLTaNe8BiFYNIyg+Xi1gQYNlqEEurLvBDe+OUuIwqyetYMz68HPP1L9
	UuXw5Hc8VdPfvT6FnJfdIurnVZ6HNnwro57YGWYEDw7AydujJ0vU5rX1bVoqz8RbJ+LALQOyGUZ
	T2htP3IPCk32GgXRWRqcqmayrdSGiI2eqmZo22g3YAKN5mnch283hhfQoOBMYi80wTNH5H++k6g
	DdxVplWF6FvW4OekbmKPPJ2rBJ1PNCE/hXykxHb2G6mqtn2i9ILGH3w4BvBA/EKXDdsRJ5zbus=
X-Google-Smtp-Source: AGHT+IHqOirBZstSfYx6JiXmK1tP63cY6i0TWPO19FfSKxMKoV+jcXzzn/Z280M9yArEGees9/iZMQ==
X-Received: by 2002:a5d:584e:0:b0:385:e5d8:3ec2 with SMTP id ffacd0b85a97d-38a221f9c94mr4138698f8f.28.1734712733628;
        Fri, 20 Dec 2024 08:38:53 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366128a3c9sm50183285e9.40.2024.12.20.08.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:38:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
In-Reply-To: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
References: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
Subject: Re: [PATCH v2 0/6] nvmem: rmem: cleanup & add checksumming support
 for Mobileye EyeQ5
Message-Id: <173471273278.222247.2932059480135959910.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 16:38:52 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2


On Mon, 09 Dec 2024 16:59:34 +0100, Théo Lebrun wrote:
> This series is two-fold.
> 
>  - First some cleanup to nvmem/rmem.
> 
>    [PATCH 2/6] nvmem: specify ->reg_read/reg_write() expected return values
>    [PATCH 3/6] nvmem: rmem: make ->reg_read() straight forward code
>    [PATCH 4/6] nvmem: rmem: remove unused struct rmem::size field
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: nvmem: rmem: Add mobileye,eyeq5-bootloader-config
      commit: 21c97c8e6c3a71be6bbc65c1208179aa660fe09c
[2/6] nvmem: specify ->reg_read/reg_write() expected return values
      commit: c66eab50332f47a12fca4839e64beceb125dacd7
[3/6] nvmem: rmem: make ->reg_read() straight forward code
      commit: 231465538ec46e7cfccc76cbf9f62525acba7fc0
[4/6] nvmem: rmem: remove unused struct rmem::size field
      commit: f6565dd8f1f38ef7eecba78848bea20255177a0d
[5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5 NVMEM
      commit: 1b2cc9a90cf4542a3267dedcd5db69fc75da0ef6
[6/6] MIPS: mobileye: eyeq5: add bootloader config reserved memory
      commit: b5edb40c25c38b0c6cc7330dea75efc4bc7b0c2e

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


