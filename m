Return-Path: <linux-mips+bounces-6523-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E249B38A2
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF191B21EE7
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F661EE00A;
	Mon, 28 Oct 2024 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ko7JtBla"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EA91E32DD;
	Mon, 28 Oct 2024 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138407; cv=none; b=XHg7kYa0hBkKq256cPhptz92c38+BztG4K0FMDnBFY9j5vtq4xKVnbUO3TQO/jLa5eQv671kFG4UTiqnnGgsJEGHtjnfVbfnOpeU2BrzsIuhHlxWCphNLGB3sGlZquLz5DV0ITFk1bQuRuaLlr1a2la0MW2bgyS7XSHKQB5p+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138407; c=relaxed/simple;
	bh=1R/Tb0SJiU1keUkgHz9X53MLpIuXfiBUmnoI6VhnQpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RvKvYTZagiWQ3TSj2CCHM11n4SXTjcls50K4/yH5Ai9Z+cNFIIyGnapWvprT0HE63Hdlg7t0YAzjen4QHbxeo1bEcRcFW8znnY1EGsjXG4snAeEe6Fw14xHEEgAGNqrw2SAYs7db3lxkr0aNvcQFd/HaHpH6MkfA3SSAVq9uzNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ko7JtBla; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0c40849cso752288366b.3;
        Mon, 28 Oct 2024 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138404; x=1730743204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAbmYZ1mhTULYI3vw1kfmqedtmD2E3ytfSgsYzBMC3Y=;
        b=Ko7JtBlaFfUc7rXLaBC3mha4ho332XwwYzid8f4B4qtsw1U0KxzXT2lr2XcURFrLza
         SeAvKAHuRzue1eIjCVjTVGC85aaXyqztmpyRGjEfEAHnnQrIRy+DU3+/OYqDGlnRK4E5
         INjN4ctaFWOBmvGvoLE0XnCBWDa3FCgre3d+iGVeivjGkzDXosQLqUAIGlBm/PcCpHEu
         nrB2khT3kmKK9ytOGQWRiKOCICZQ09MT9gOZ34bPTkmN1qV0O3NUhnoZ7M0Rfvh+T2eY
         WcfW/LdRGVPSZIcZ1CuFVIufcobgQ2od4eCJiQrxBb5bwTTm+6T3QBO8mxAWbKCxNr3x
         mU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138404; x=1730743204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAbmYZ1mhTULYI3vw1kfmqedtmD2E3ytfSgsYzBMC3Y=;
        b=fDn02kNXhUfA8m9ryIPinLek/Gqvme9JCM4XBBUAiSXVN10ycld5Q0qw7fwE6rd7yH
         qumINbXLhHlx+fsF8G1P/OEl+8ze6qPwRSSbwavxB7CqNWpIhKyYAL8LpxMrYKum9UdO
         8rKLjcCvZ/FDtaAW+768aBWGGrgalIhkc18/l2g4FwzA58akCias4lARDTCBq+XbDHrH
         O3JTT7MAOlC50eZow7bt7Y3WMwk4BOmoDhPITTfdCofYSHzIgVhkg1pwQNkeD+OLcgNL
         GJWmckBAt7q5owNqMR9aNMqdQiO4/hFfaXSVQ7vULTStt9OETK55DglqQE9jK/MeC6kn
         EWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXQhgqXDbHAWRxDqv+DkdAgRQxLacKepxjCqX7aEcerdt0aV0bAZNUotOAjeJ3dVRnb4AMUaAJq95wzg==@vger.kernel.org, AJvYcCWZ1MNje70s1vzZSzzkUPIOpdkTm5bCqmBJHfZtw6SPyYFWCzkKeCsL1PiIrcvCRNKgu+5LT9JqUMdGKue7@vger.kernel.org, AJvYcCXDlnDqvoNKtbPN/NGMz+2MJ2pUw434fvM4SP3XnHzcdJnhvYm1qMbOWKz4j5RiABOkf7lxEwq3uzro@vger.kernel.org
X-Gm-Message-State: AOJu0YxRrt0wMccEwkQfbx+ZPagr1hXRJQkKlbKPkXuwUK0+orKg/1Ed
	0QCI1ffDFpV/JWjwglPKIjMH7Xii8rx3pnGybtYK0GtWxSlIEXD+
X-Google-Smtp-Source: AGHT+IE9G5kZr2VnQdi3oJ5fK9NfyoYvvRFAnLjyDDKECkhSiYMPXb7MozsNPe9M9cfg9spN/dDNoQ==
X-Received: by 2002:a17:906:794f:b0:a9a:4597:a7f3 with SMTP id a640c23a62f3a-a9de619876amr929630166b.62.1730138404031;
        Mon, 28 Oct 2024 11:00:04 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.11.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:00:02 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
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
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v8 12/13] MIPS: mobileye: dts: eyeq6h: Enable cluster support
Date: Mon, 28 Oct 2024 18:59:34 +0100
Message-Id: <20241028175935.51250-13-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028175935.51250-1-arikalo@gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
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
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
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


