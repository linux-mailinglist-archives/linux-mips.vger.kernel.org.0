Return-Path: <linux-mips+bounces-6157-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8859A4BB9
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 09:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A3CC1C22127
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 07:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2DC1E04B6;
	Sat, 19 Oct 2024 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgJWlyhW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B921E00B9;
	Sat, 19 Oct 2024 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321870; cv=none; b=ftYBLVYsARhavZ2ZMQ/e4UxFTWIWcymaQpjke7E4rtNfoC2mvEeNIPqZoBUunr6RyW/tl9Inh/SND3rXkjIrEMRKCTRtAh0iyZQWA6CFF/OjWKakN3Z+0d8DTki2LdlqbYx6MWl3LrY5w0UuULALf+YOJALBrb99ZqRMaU0xH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321870; c=relaxed/simple;
	bh=8Rdvbq2qfDE7PP1NFqb9ER6XI8O/ncdkDxKnGaV5Ua8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n3FkZuXxlt0YWBJ3LAVw/cQybp8GYiH4m8zIgHdMCCs6RIjdApkNcYFb24E7KbOdaS/qE8DYbSGsdYFvMqqPo28SfgCobFkCC//h4yt7Z5qgkRvV/c+2uBYz1k4qZ00Hmzg1gyi+yZwfSYeYkUYZdZBEyTyzAfy5kVOdQ8fa9h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgJWlyhW; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a99eb8b607aso277572266b.2;
        Sat, 19 Oct 2024 00:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729321867; x=1729926667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzy3+/mox2Buapv8j2OU8DMyaGI/RgG1tSMX4+L61bY=;
        b=ZgJWlyhWapXA7ILUY8hchK1uhKr8IzNYzMc9PLWrZUn25RKHV888KfDK48QSrP8ojP
         1qs/83vxIMTo5JIdjU4gZcJTEocOT81g9tj+WgS71Tkm++bwj/d4rfIVF8NQmM3B5qpP
         PMTwdLb5L96O2JgNyijyQoVy456GACFz2mg7DIjgrLo7imAKr7R17k6LGS/WcGLNswom
         bidRQ9BMJHeG0PAI0/UL3QuJ+rpnDz+QYX8qQiUPGVC60xOSfjsQRBGvHo9rJlouUpwp
         9Hi51dkZE8Bk+NMjI5sqRz3Tvxh4dodizAJiUV3UMTnl97KsFAShJJ1JD80yySsCLvZj
         YV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729321867; x=1729926667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzy3+/mox2Buapv8j2OU8DMyaGI/RgG1tSMX4+L61bY=;
        b=dPD/JOJ7GmTvJAV69wLr/hIS0X5wMYMU6g8BEcN4H6X4hJZkK1dQnLxI82xk73Ud2e
         c5HPEjMJKRqIYuDrbjyi4j1OQ4V4Y2QIM5IIAXgRAjaBxeBt/PMrDoYCLErP1T2kwpM1
         +9GdWXSuvpCM4NpNZaR9Fbp4YoukJ9GOjrFUoWGIWxUKmSCH9BgFAuIOjnMheLCrZ84B
         crplunZdDRYkXqM9Dw78++O5dC6UAPW9f/vSS6d9TcB0NzlB+VF8aSc3CJ794MuxzoMT
         gedN7pDXVbeuxZsEr9c2m/VJX0DKA/qY1WIwDTzLx9/DJbMzJk3jzBe8NsCKgZ11S4n/
         RVMw==
X-Forwarded-Encrypted: i=1; AJvYcCWHc2zJlixGyaoP1JS3YgarTcIl5wP1NeVB3ouBhg1m+qNP5V1007dJfz3ez3v7yR8TWSqdcv4cJh6K9pc=@vger.kernel.org, AJvYcCWZND2WGmQ4+0LuJvAe5oPjDmtYTm39KYZUex5evzIHbADUSbEa8ha5SOIBztTcH6oD2pXUWyvnNMIaiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGS7c7GmsBw7Z5RIIFgvBiFai95tdyVqHQgP1ANYZ668mD71+Z
	xPNc3WVw/tb1x7W5mda2MKJGSsuVgy/ECcOoXXsg7XyG/yegV9+q
X-Google-Smtp-Source: AGHT+IGZIRwgVgg1BdPksrFMh32OAbnzMG5ExBavQuLgkOmWN/ZJyj1zGihqDyRijK+wUugTMmXfag==
X-Received: by 2002:a17:906:730e:b0:a99:e939:d69e with SMTP id a640c23a62f3a-a9a69c67624mr373039666b.51.1729321866457;
        Sat, 19 Oct 2024 00:11:06 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27841sm180566666b.192.2024.10.19.00.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:11:05 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v7 12/12] MIPS: mobileye: dts: eyeq6h: Enable cluster support
Date: Sat, 19 Oct 2024 09:10:37 +0200
Message-Id: <20241019071037.145314-13-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241019071037.145314-1-arikalo@gmail.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gregory CLEMENT <gregory.clement@bootlin.com>

The CM3.5 device used in EyeQ6H SoCs incorrectly reports the status
for Hardware Cache Initialization (HCI). This commit adds a property
to acknowledge this issue, which enables the use of the second CPU
cluster.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index 1db3c3cda2e3..4ea85dfd4eed 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -18,6 +18,7 @@ cpu@0 {
 			compatible = "img,i6500";
 			reg = <0>;
 			clocks = <&occ_cpu>;
+			cm3-l2-config-hci-broken;
 		};
 	};
 
-- 
2.25.1


