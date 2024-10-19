Return-Path: <linux-mips+bounces-6151-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5439A4BAD
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 09:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21EA21F22DAA
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 07:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F3A1DF752;
	Sat, 19 Oct 2024 07:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXpA+gc9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B8F1DF262;
	Sat, 19 Oct 2024 07:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321859; cv=none; b=nwg8DdrQaMIFg2VApIe8sXdHqUcwFlIWierkKI6rVua4a74GGBYuvMe2MD1KSeDXvB5u3VdnESMSpVK6AYvrUKgPSUPXwp3cCpevlVR8pFIgww2wKmnpTNrNxSKKuumDKRmE7XH0yjnqmNWYJuDolkUYgiZA6uvkQihGb5f5/eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321859; c=relaxed/simple;
	bh=V5rAjTu+pU2fpi74fQ5x5suB+2X7eoYvm+lLjy+3z2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LDS/OikYn3jK0FhwIeGACyYi/mKhLmG6/LYPcvXzV+mfI5IIbMsfn2JNmtopdeyhz/nuFSHa1gYHKsnh4JQ/A5pYxJhkXvez6iC07l+Om8XcFx35HFEjJWO/6Z488VdZN06A7cJr9zF26dqmkdGSx2BBs2OVyYx8zYeGG+dF1zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXpA+gc9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a4031f69fso366586766b.0;
        Sat, 19 Oct 2024 00:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729321855; x=1729926655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TY2C2Lxi2lZ2EXUmAkUJgOoy7I3aUdzu6U8J4ynR6M=;
        b=QXpA+gc9T9Cb6TpGr9b6cHWB+Q3tfQzZqT2lAcDOvdEJ/tUYGrOt1bi7fPU9+qRge+
         kltz/toQt0WwKwIm8N9OEnSNFM6zOGzcsRmF3uBIIU1AJSwkYgKaAl9zbW2Y0lQAsKPz
         bYVWmPC0FXIeiz2lyP8HzXdtmOutaYbAZuTH5Y4ab8hOszw1oZD7pQrpDEXZ6aNlW91W
         s/Bh2pOJmAS8spEydVwLPcDLG+5m1ciMGsWQcq2xOqElK+1QvX+QZ1itHCm7JBhfZdcI
         9hVXE5SdPerf4s+2cHO9mVn27PoSr8OaZ6nknqIW5VgbVrrpGmtx5v60LEbtdxgTFHYI
         LMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729321855; x=1729926655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TY2C2Lxi2lZ2EXUmAkUJgOoy7I3aUdzu6U8J4ynR6M=;
        b=OsofPbK5XOLGyABxSW16HcWUKsPQ1/ZfE9pfrhqgJDGdJGR1woUoBzHS+aWVO3tHGV
         znFnj26HdEo/jz3pczUz40lB5nCcx+0o7X7OuyhzU0sZFchOJViyplExWJBhfDdi8Mme
         O1RnpuZ9S8vdvXJfcGWJjklQzES1EW8+B1AlVrSPsc1OI8Zz2mbtPNuJaUT1gS6FH8ln
         blf7aN4Yh/uI/yntEfvQsyb01GUqq4RH4J2lt7nbEZy1QWfjwvfjk518/S9umgL1kGgz
         gDS7XQpGXnxirU6NM8jrggBsyUC9bN/R+a3YuwGYM0Iy2/J0bkeIOiw9y5qzYl4EVUMF
         y3xg==
X-Forwarded-Encrypted: i=1; AJvYcCUl7zbuimAH5oNZ50OJJRFlbPL933fqpkzimDLwNe2R86vWFipTkE9lLi3SSTw3+XL54NLtnSJO3JVwTbM=@vger.kernel.org, AJvYcCV/vnXSxTgpDEUXle0vpGvih9ZNX7K11T2Dc6rd9sKpTX59feBi47pbf3RaMglaE0Z1D5n+Mp7wfo6i5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxMWDELTxP5PeSHnIX+YmdRiKrewlVwzBehNv1rPYUC/VTO5nZ
	1yI2AfuxGIM5V/DhjRYF+xKw+HjYweLZ6pIrXup4/QOeIur7E9jz
X-Google-Smtp-Source: AGHT+IEV7/3h0JUHrhmJMQszJL6kUDS2mzOCwK4Q1bg7OTC00KLPrfKhu7HG+S0TEpZfGhtIVg5K4A==
X-Received: by 2002:a17:906:6a29:b0:a99:e504:40c5 with SMTP id a640c23a62f3a-a9a69bb4776mr432006366b.39.1729321855209;
        Sat, 19 Oct 2024 00:10:55 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27841sm180566666b.192.2024.10.19.00.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:10:53 -0700 (PDT)
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
Subject: [PATCH v7 06/12] clocksource: mips-gic-timer: Enable counter when CPUs start
Date: Sat, 19 Oct 2024 09:10:31 +0200
Message-Id: <20241019071037.145314-7-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241019071037.145314-1-arikalo@gmail.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
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


