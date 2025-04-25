Return-Path: <linux-mips+bounces-8742-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF6A9C103
	for <lists+linux-mips@lfdr.de>; Fri, 25 Apr 2025 10:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 324341BA6DFC
	for <lists+linux-mips@lfdr.de>; Fri, 25 Apr 2025 08:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702201F30BE;
	Fri, 25 Apr 2025 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EPY8U5tE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D2B15C0
	for <linux-mips@vger.kernel.org>; Fri, 25 Apr 2025 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569879; cv=none; b=PsTEvtjOb6W4HDyNJbIcL9aJSlBALj+EQO1/to0wON6H3deCP8sFZeUQqQZ/59zRBcFM5duHJyDYkMWEblEjRjuaCBlDgyb/28ou7o2b2t/oiGhodCbpYBOm0wKHE5qJcakXuXQQCmcG4IOW0SfvUGkdXHYoODkkG7KWRlr5Vos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569879; c=relaxed/simple;
	bh=zf46uS1WEGGWzqLPEonBFYo5ypXpA+q9qubZ5avdeVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLel+7nDjU9Sawx0f8SYuNmbZpu19E40AaxiIIUGSVWVKYoXMWFUfV/Mwf6NAnsrcOJ4eA0Qei36PJnm1fN8qhb71aOPXe7nPxedafKQyUBuJ1NLkEyB1Vuu/QFe/YyW3AAaUyBilSlujbvufrMXucUG7Udc7dnqdFWc82/ImKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EPY8U5tE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so1459997f8f.2
        for <linux-mips@vger.kernel.org>; Fri, 25 Apr 2025 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745569875; x=1746174675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf46uS1WEGGWzqLPEonBFYo5ypXpA+q9qubZ5avdeVg=;
        b=EPY8U5tEQtrp3EcSGeKWD4xmj8krUF6GQO42fEwa+KPHRL1o8oOH7NdMm/wh/RIw5K
         Md1ZqUogx6YubRVE5BroxhNJaRPnBEk/GzvPBfq7L+oFxqcR1pOEWpZP5mohoXTpx23Q
         pnKaPccY+iub7SI+BG+7RiQsaKIi5nIsNUZyQ/EpdS4fzQqSKqcF5b3PLnd5FmX9F4+u
         P/gxIJ9w2Xf5BhhcmGwkd8T9nC6KZebCh34Y0di6nr1J0Gl7TuohcCLegln5r72iwcMU
         l5+netCqGLMMOBcEUJ9gAAqaVnbjVmATQYBNFtnDmT4mqL7KPk3ljhHffZj1Rj1IcMv4
         fj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569875; x=1746174675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zf46uS1WEGGWzqLPEonBFYo5ypXpA+q9qubZ5avdeVg=;
        b=wV7n5MVa352jfZK8Z+f1yHQ2bCoATpfPIqcoFWCCa3Oa5+HdIT/qH15vaE0JDfohd4
         TKMSa9yCtO68uz0chR7SB1/mzySxUlXLKCgAm4LnQfaRkDPl8EGg9VdPSPgWmlGjAdzs
         DXR7fh6p2MwLcsygQ2uFjSfZUAc6zPACTNoG75E3t9uRtipuj3DdRCYPeLbHYQQZ8wbf
         rzdUsq4MWXPcoITBnSKk0dwgQAZkqqBf7zEOR+pdlVawc/En5FUKb44RpI4URZB4qxN+
         /myT8/duleDUG5+uwuP77CaQwIhTBVqhx/CPbSf+CVJWXrI//Eh6NMloiKAfP+FtepOV
         KWCg==
X-Forwarded-Encrypted: i=1; AJvYcCX1rxVrVuEnKCS7Ft3v+Kd3D2GFvBy2CyXYqNc6mzNh2VBlYb22pasuxKatVStt860SyPqdWytzZWTj@vger.kernel.org
X-Gm-Message-State: AOJu0YyuDTwqLQABK3llPI9732Uo3NDiYKCWOqgurnJfjVy7WFBfalCc
	hgEVT4Yg8XhrTYLGptnK6bL0QmFgJsZ89tEQD1dLLv8cXizWp9/6zpQ8BG+uSFY=
X-Gm-Gg: ASbGncuS/BEv92gM6bPSsPlweZCJ8Tdz4HzX9at8ZUKX9Q8cRHOCJUxw5MQcNu/ZALu
	Uani349MBSR4QLxRfZCLvB+LanyP5t/3KB8Eehe1CzldcYgkvJIfbPEMG5QRtvcRMdP/6Nlxxgt
	ZXy1QNF1kqlfDmV9QcEZ97GyAK47m02tZyPYrEMyZ/6vM3iONdhp9R73regFI3KKR0IRayHuhzl
	RP+qvza2+PhFsAzel2lXB+JMbwp50jPpWibZrkw392KHrS2Zmbn3Lom3yPjSxg3q91DAHM63Asm
	uMJbwDztOgZF0C0O0G01P9aa/CklVwLVf651n4rzp5Wc1CLTWdqeGcaR/8mVTD1X
X-Google-Smtp-Source: AGHT+IEGdodZj4yj6zqoEzlVTRVZPOKQ82CqHa0k8vGppZ4HJ5qkzSOxRm+naS8oNRD4cB6uvhxdGA==
X-Received: by 2002:a05:6000:1a89:b0:391:43cb:43e3 with SMTP id ffacd0b85a97d-3a074f39839mr1164197f8f.46.1745569875556;
        Fri, 25 Apr 2025 01:31:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f89b2sm17104625e9.8.2025.04.25.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:31:15 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: marco.crivellari@suse.com
Cc: anna-maria@linutronix.de,
	chenhuacai@kernel.org,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	peterz@infradead.org,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de
Subject: Re: [PATCH v7 1/2] MIPS: Fix idle VS timer enqueue
Date: Fri, 25 Apr 2025 10:30:43 +0200
Message-ID: <20250425083043.16671-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403161143.361461-2-marco.crivellari@suse.com>
References: <20250403161143.361461-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle Ping.

Thanks.

