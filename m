Return-Path: <linux-mips+bounces-6752-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4AD9CD60B
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 04:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28739B20B4F
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 03:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3130155312;
	Fri, 15 Nov 2024 03:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CE82Z1vP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DE1442F4
	for <linux-mips@vger.kernel.org>; Fri, 15 Nov 2024 03:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731643060; cv=none; b=rmMdWMV/Nrv67DXp+CWslekkVwvV9SkpjPzPbysNi8tywf6LGipE+f1tkGv/qx5ntt5y4K/VMXJh4487DMyac8eVTbt9i+HGtrdVRse2o08dVzy35Y1lSsT2aTpwEmM2pM2+o+SSn5Vlf6K6TVS+Up74HJ5/gsKdbqxd9TUb+fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731643060; c=relaxed/simple;
	bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=qJAOeMuMvOMXKjNZjUC7ja8YpDTJxi+/CG6UWoEDpOb4MSSxEqZaqiEaNEPBy9pvBa71O5au5Fx3dWpF31P5QVubleGHFIfQ9QH2j1v061erPmUtNFZyUyG3VSHiZjUufA63qVkHPH35IC8Oky0PyMIfDKS5aIIctANv71Tm76U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CE82Z1vP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431616c23b5so7685655e9.0
        for <linux-mips@vger.kernel.org>; Thu, 14 Nov 2024 19:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731643057; x=1732247857; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=CE82Z1vPNjuK7R+iRTcc26f+qR5L/lmdx4cc8WSonDj1e8HWq5UPdX+nYT26nXbPGn
         gHSWm1qCXGvEznWUK/aKIMFdAclHsX520T3WQwPeSgXp8eQp2SXaDPexZsXgOuDTrj7v
         6ho5DrVKygteYw6znJc0OkFVqvKtyYK8T/lNk+7FldquzC49aZgnw2ezhAN4/8LbW7HQ
         9aQs3d7kw2o8JSC7/SuaCeMwhJuLewddidRrVwlQCTPJGXd1UrNYRJSXLsAdBwpJnR99
         OVadBXYnLlFgLdlfk+gICaHFj3aiDXBy8jrf0nCxZsmn7d93pdU7nxRuejs8uoqYL/MB
         Z7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731643057; x=1732247857;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=t5kjEywVfOAEgH8cKTz3BAw10JdLiHEt9kwut3qdRe+9IXKahjoGeY0mt6Am7ClHfW
         XzH12AEcwnp71f7rBKnHFf9Ur91xICjJO10+RxOObtZAMYdL8V8jxOj1qhOufuW+Rr+w
         k3FD4o30yxkbX/TX0O/vJLnPayt1kQqab97D3hZ6fwnfvhWAE42lwIM5sFp0lxAInolh
         vu/JIVmtpZuUqM4BiYubwnlgTEBptL/y5Y0Hw9ehWVnGms/jOJm/3Ga/ptqSZpxzbMAb
         qN2Lk5ur9qFbtDWOeme/SNaIm//0eRjmGZ5w/fpxkHFycr0ZtkfCpxaRbj92kZIUBIbv
         YeFg==
X-Gm-Message-State: AOJu0Ywewa/BhHfsYGYF7sHplrWb+Zzx3g3V+dNv8I9nmTVji6uV9FTA
	b73va68edIwTBQpTL27wevw3eKJJCy4t/VvdhR3bMSS4kp8T+F5SIAdzxw==
X-Google-Smtp-Source: AGHT+IFWuHFUsT5Lxvh8bpz00J5cEdBkEzYcjfHxmCcv3uNsSCi60BCsaYtzNfEr9/kV5P+wCSPP7w==
X-Received: by 2002:a05:600c:46c3:b0:431:7ccd:ff8a with SMTP id 5b1f17b1804b1-432df025f56mr10380295e9.14.1731643057087;
        Thu, 14 Nov 2024 19:57:37 -0800 (PST)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac0ae45sm40276475e9.30.2024.11.14.19.57.36
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Nov 2024 19:57:36 -0800 (PST)
From: William Cheung <likhirahaman6437@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <fc6ef28406c906dc56f594876117c5dab8547fe9f6dc9fee989c4b37483238c5@mx.google.com>
Reply-To: willchg@hotmail.com
To: linux-mips@vger.kernel.org
Subject: Lucrative Proposal
Date: Thu, 14 Nov 2024 19:57:34 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

I have a lucratuve proposal for you, reply for more info.

