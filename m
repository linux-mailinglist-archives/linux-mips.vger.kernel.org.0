Return-Path: <linux-mips+bounces-12872-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E67D159E6
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33E09300C34F
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D61D2C08BC;
	Mon, 12 Jan 2026 22:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K+x5Vf6W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tskS2foK"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365FB2BE034
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258142; cv=none; b=ltOOKjDdf1KASGxOclj+NqWUpfBSpgrR+vYugUl/xMuCc9/Ke9srtBTUQ1/YNv3RSo6ymEw0t291VCGPG7mVKvi8qjWt+BZmRNwxVwp7SdZXS7g410eX7U+XWmfyE0yxLYOlWvZCYLeJJAaTT0QmlQKpAiQ75ntm0eBNjVjak/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258142; c=relaxed/simple;
	bh=bp7kgvXwR/z2HTYh9L+d2gqJ42hxPb2LIWMCj3tGJL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2r/R5AZP34IR5SVMv3xkpeYHmYGFPHCTvjvY1NTS6SN0GtMWRX17VGDVxIpwR5vrS/qgyPceWcgxWocRYNcpjAI70kHjCgAesNMeZF84QAFLT8/aFXPawJdKMAn6K2gTEvbnOEmkxoKOCts67cE9l2wEa2rVbnpvcIpsvntquQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K+x5Vf6W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tskS2foK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WFK7CWWCcElHpWdcqTdYEyForqsKKnCdXysGYmeirHY=;
	b=K+x5Vf6WWRaquLi8fXbNfVwrAsE+l8vXC3XZjoruHmioDpMoKqGE0tPqj+nst/qN+LN+Cv
	N1SkvTeZ8uv1jiuI69QDjNAJAfpvrGi4sjZ47DkDFS0brVFcefT3LyCzdt55t8sY3egsjg
	4vy4fWxNcrlPpMDFuStR74631QoH3I4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-XMsd1Y_5PjydnuT2uufMHQ-1; Mon, 12 Jan 2026 17:48:54 -0500
X-MC-Unique: XMsd1Y_5PjydnuT2uufMHQ-1
X-Mimecast-MFC-AGG-ID: XMsd1Y_5PjydnuT2uufMHQ_1768258134
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9ff555d2dso1953113985a.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258134; x=1768862934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFK7CWWCcElHpWdcqTdYEyForqsKKnCdXysGYmeirHY=;
        b=tskS2foKk9KE+eGfNt2ScALMD26CcppXZikuYWs4oPunxJaNh69PumMEbh7/tNfuaN
         xu0BYyxuw2AyO2GGV07ytQFHmEhvsN5dilLlMH9XomG166OHTSMfJH+Ry1t8cQl/wdQs
         EviZnhcHq0Hq/684EOvfKqxM1bBlVgG8Ff+UDjqzXTxJc+NjwVQ+51uL1D/LwBwQy4lL
         QAOW5jYH6+1rvbKp4CYYtb3DlrWE5QjbXbFyGirvhHBzhCTYm+uPPbkU+x42fZnIGDKf
         qLSbZegN1cXXBUeifjR7oF4sv2Ps+3oJvdWtEbOAXo9t7sCStJUSd65rptNYrtvVd0OP
         fFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258134; x=1768862934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFK7CWWCcElHpWdcqTdYEyForqsKKnCdXysGYmeirHY=;
        b=kyPKx5lKCoK3NBy0sVH4gM7M1+ZQ3iJQu+FRgAhVLKMWzqX1OWgpPwJt6nPhZUfTNj
         lSTo0QxrDRVVRY+KkBEPqxIkcj+qKS7367b2/rkqOV83Yoh3ps7MviCFf2ME9v8vjH9M
         wljZYOFmF+V7Fm9kNCoOIz27sQ0patO+YahPhLcoRGA9t98LpQmKqX2Jl4ZRYXubC/lA
         dAq2NbCIycOj5iGLV4xfkHzr2BUfYwyfpuGi0LmZDtnTXhAkVZiXZ1B2PAVA/vuuObig
         R8a0/aMEHPPyW3AO0IUJrr8WAMXxDFhf7pJNsduH+h8GZr3i7qHBvBwMcLh0h//DiP63
         keUA==
X-Gm-Message-State: AOJu0Yw/CuMiFyhk5MkBKDQnfx0ZRwo9PqgRjggFnn+k+PT2yvw4Mees
	ihZz8fq6F7nYCqoZ+0KFsgysUiXJSvZaBGonM/nP6N+6yBLWPSDo7D0PgLf/Md/1BV2Gci/X+xm
	JR9lb3JyE7n482X4FuNs8Yw0UNnt9vszR6FYVCfewrBLRMhDnWRrvtMSbzfQulKQ6FoOmeMI=
X-Gm-Gg: AY/fxX5T38B7Q1Qk52UqX+D5HPa8pZhMWWdN4YQRaDyBtHfiyFmhOK/ernmqN9bH0hm
	HRbJmMLcwffPMkz6aKo0vwKg0VdS7bjRSdXRAkMFHwbF8otPJ66bGuJMgoq+1lIYE+F0stg/MOi
	2Do8+LJLn1OVatw5lN+pUk4hf7Q5yZpupzOnMYBrV2WJd2eOLYYqJiU3fPaKquq6jem6cosQZF7
	Td4PwkuLH+PwnRZxTO5Whzk2vWRhnPbjXbA/iRjOrgcYHXuMpInhaFgfsuxIsLXFEJ2WukDUyUf
	0GP17Ug1F7+WAMv4m6pyW18Q1WiD5bjEr6w6ywf8/wGIegBdpwbFpv1D2qvbo8m7b54matFT6MF
	xRAqx6AMSYyR0ziHQmek5phE2YHRrnbUoKiOZaWessj+ia2tHoA==
X-Received: by 2002:a05:620a:29cc:b0:8ba:1326:8c56 with SMTP id af79cd13be357-8c3893f7e7emr2712964885a.63.1768258133975;
        Mon, 12 Jan 2026 14:48:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1Jsf+6fADrBv64kkTVcCERUv14hR02xEurAFVAEWiCzwZyo42IzWD06Q+2fpMpbmQ+c3g4w==
X-Received: by 2002:a05:620a:29cc:b0:8ba:1326:8c56 with SMTP id af79cd13be357-8c3893f7e7emr2712963485a.63.1768258133590;
        Mon, 12 Jan 2026 14:48:53 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:53 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:47:59 -0500
Subject: [PATCH v2 05/16] MAINTAINERS: add
 include/linux/platform_data/pic32.h to MIPS entry
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-5-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=669; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bp7kgvXwR/z2HTYh9L+d2gqJ42hxPb2LIWMCj3tGJL4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7x+OZlc7Lb2TV14M71g4z62/Ub5J3YsdanMe/WZm
 a8xNaGro5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlcesPwV+CKYXqq5evYKUb7
 L9a9sBZlzAzPTdEyX7h0Q4S8S7xRG8NfkVWv4wTfBdgE/pJkVNgo/MXnruaDbdn7n8ouF2BaGr+
 GEQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add the file include/linux/platform_data/pic32.h to the MIPS maintainer
entry.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ecae8a5e33cce6f2cb883c1b14b7908e71dbfb5d..bc864e1d263ba8d347e6364477c51f70270467fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17545,6 +17545,7 @@ F:	Documentation/arch/mips/
 F:	arch/mips/
 F:	drivers/platform/mips/
 F:	include/dt-bindings/mips/
+F:	include/linux/platform_data/pic32.h
 
 MIPS BOSTON DEVELOPMENT BOARD
 M:	Paul Burton <paulburton@kernel.org>

-- 
2.52.0


