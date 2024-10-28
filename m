Return-Path: <linux-mips+bounces-6517-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5229B388C
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49DCE284AC8
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B731E0493;
	Mon, 28 Oct 2024 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMTzjD1z"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA28E1DFD90;
	Mon, 28 Oct 2024 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138395; cv=none; b=pCLLVCrqS9X2n6YslHHmqnTLQvD0MnqKNyau/sIMeJNYTtNgk0ywGTdfxpydS4EJsZhWc5mWqTTKwlYeFZ4BOVVbyeoMigNHGOWUkN5eDhK6vCFvllr07DiUDXdAPwDWHIioV6iYJP1dzzWvOsftsBSTjTLDtnEiqEIGrDtbf0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138395; c=relaxed/simple;
	bh=4JnwAaxzzTAViWg7ct3Xj13ZKq9MDJz4VfUrOXaNL+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XVcjyDkzIk3n54rHiHRJnJi/f57cbImtuvjn+/RACiAihkXZk4w8BbUKlfJWUcA7PKQxsqFEVRZXXKWAbtadROxcAkVqWDTsSXBDx4/YttiHrlnu0X6giVhw+23q7C+z8YF/4UCCs3EaaYwpPuaPP9tEyaICE6ZmiEs9OnkLqCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMTzjD1z; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a0472306cso630900866b.3;
        Mon, 28 Oct 2024 10:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138391; x=1730743191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRZGYpywOr8SfCIjJp+/4G1Vc/5w1pIrXams/TeKR5k=;
        b=gMTzjD1zpezRWpzhwxe2hQM8neyMeczSqdGq1mDrGdjXqb6pfxF/12pHgs8vi1Wkbd
         x3zzLn1p4/NbKl1BIoN2PUROS5i1nyCk9t+KIuAcc7Q8lovOwmbaePEXZDiNgQkwq/gS
         UihkGnDxrwWB8aSOpbGYfxwRXzh8qWDk3G5bLUf9H7e4ApIMzXqmf7qPvxd41dO5qxmk
         s0/LosaC3eNYP4DXEpn8gxNjjIhIqh6IxTQWzBBMaXZYRb7Qu1J/CmyStdS6p7qTqTtI
         03QvdyA0N8Zuokf5aXyzQzWMlNiu8nQI0JX58X5PvTe7UzAqQls/L7mnJs1KzEb7UvjV
         Bd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138391; x=1730743191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRZGYpywOr8SfCIjJp+/4G1Vc/5w1pIrXams/TeKR5k=;
        b=qb9L3K3TmJRHIBjuiKWu1Dz98+uhVuXhQTwMUmQIZI0ExwpR2wZn7nQ8XzwE1BRMc5
         u5nIHjrzMPJVHu27pdEdU3wxbm5RoKGSr9k9m3W7jPeZ0RM9B1qva75U2P6Rm4F3hjl9
         1OyGQHdByK3QlghW3uD5ZKNpC9qu4LkR9+y4Kwj5TwcPa0o8Nit9nNP+pvHh02scj4Rc
         BF7M2pGbmVyY9vVkH79MQDOwrtN8sCzS7MWwCddRJ/GF2GfyQCymgPYmoOXBBHG80AyK
         H877h0tumUkC9Tl4Np94WR0l9Jv9Vq2/NFkrj6Ml4UwpRQyQzGCBHKcf3baQqzpv2V8O
         IQeg==
X-Forwarded-Encrypted: i=1; AJvYcCUF7UFHooxpaHx0VzbMGe14OKk4aIzMgmquS5RwTgHPtS1JmleIag5eI0Tp9nYuEX8NH56xZWqs07TO@vger.kernel.org, AJvYcCW9yDrzeSou8toq2XUNHBSqv1LfqFLLa2/agbClY+D0aTOq2uKIuvm88wDGvNJHSjDE5km78tBAtgxQCVCx@vger.kernel.org, AJvYcCWa6Tttuv3zKz8b2eNbzVXlfv++6ySWgI+GkJ6G/sfEtz2Z2FbPqNW9yeGtFLNGPozDboNojHCFDwb4kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYgUNh100CCv4q2yZv1gNutrUUhW4TCTjeKcp/+YWWhItQG8XE
	bv1Nz6H+Oe75T0mqy8gwIKmLdhyaQ/day/0dbGjORLh9iX82zMaC
X-Google-Smtp-Source: AGHT+IG5CeFXBy+88t4/mlcYBWdzsqbqzkUPO/IOnAI5iiWjhEbd5sESo8/SN+xxquLLJjOSBHxmhw==
X-Received: by 2002:a17:906:da86:b0:a9a:49a8:f1fa with SMTP id a640c23a62f3a-a9de5db9e9bmr813270066b.23.1730138391023;
        Mon, 28 Oct 2024 10:59:51 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:50 -0700 (PDT)
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
Subject: [PATCH v8 06/13] clocksource: mips-gic-timer: Enable counter when CPUs start
Date: Mon, 28 Oct 2024 18:59:28 +0100
Message-Id: <20241028175935.51250-7-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028175935.51250-1-arikalo@gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

In multi-cluster MIPS I6500 systems there is a GIC in each cluster,
each with its own counter. When a cluster powers up the counter will
be stopped, with the COUNTSTOP bit set in the GIC_CONFIG register.

In single cluster systems, it has been fine to clear COUNTSTOP once
in gic_clocksource_of_init() to start the counter. In multi-cluster
systems, this will only have started the counter in the boot cluster,
and any CPUs in other clusters will find their counter stopped which
will break the GIC clock_event_device.

Resolve this by having CPUs clear the COUNTSTOP bit when they come
online, using the existing gic_starting_cpu() CPU hotplug callback. This
will allow CPUs in secondary clusters to ensure that the cluster's GIC
counter is running as expected.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/clocksource/mips-gic-timer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 7907b740497a..abb685a080a5 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -115,6 +115,9 @@ static void gic_update_frequency(void *data)
 
 static int gic_starting_cpu(unsigned int cpu)
 {
+	/* Ensure the GIC counter is running */
+	clear_gic_config(GIC_CONFIG_COUNTSTOP);
+
 	gic_clockevent_cpu_init(cpu, this_cpu_ptr(&gic_clockevent_device));
 	return 0;
 }
@@ -288,9 +291,6 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 			pr_warn("Unable to register clock notifier\n");
 	}
 
-	/* And finally start the counter */
-	clear_gic_config(GIC_CONFIG_COUNTSTOP);
-
 	/*
 	 * It's safe to use the MIPS GIC timer as a sched clock source only if
 	 * its ticks are stable, which is true on either the platforms with
-- 
2.25.1


