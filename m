Return-Path: <linux-mips+bounces-8194-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A70CA60DEE
	for <lists+linux-mips@lfdr.de>; Fri, 14 Mar 2025 10:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6949C188B9B3
	for <lists+linux-mips@lfdr.de>; Fri, 14 Mar 2025 09:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204211C8623;
	Fri, 14 Mar 2025 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMxkM3Qg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4931D6187
	for <linux-mips@vger.kernel.org>; Fri, 14 Mar 2025 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945960; cv=none; b=nKmKriRX2YvCii5TGIjF+oFnmZJzCUCWjqoVtGtt96eziaF3nvphaIRZ010wzLKxvQ/zlSkxao93tvkpKNTTluVolLv3OzuQGsew5lJcqdUdUOnpYjtx7IaUm/HCnBaSkbTim5WNJwJj5RaruhIz1+kdHFoeLrNWJMzn3av2Vy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945960; c=relaxed/simple;
	bh=K/5asd/53euBM6bC34RrAlVW7qDAdZITZLPvtilAXu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YL12DED4yCStzhS7NSqUZqlD5HJ6c+f9h6jjNlgZlvUxnBiFqzgQ7DxZKYK800oYL7QqikZIMPmzva3fjD1Bs9cUjCDdV3DG2ygfL2dqPRd7Wa0yrVNyciIIMCGzZ/OljT6/FBguMJ5xvwWbWX6pHyjIcOSwI1JTjZIP3MSg3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMxkM3Qg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499b18d704so1959410e87.0
        for <linux-mips@vger.kernel.org>; Fri, 14 Mar 2025 02:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741945956; x=1742550756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/5asd/53euBM6bC34RrAlVW7qDAdZITZLPvtilAXu4=;
        b=pMxkM3QgcstITlmoCwQEx/39fwvFggu+847HtwSSyC4GtmMwypqRwd3wf4VgKjJ1Zl
         nSA9hLzvysEBQ3EW2huyUlYdbnUaF0/6ST6rErSJiOv0DA/xUtqmrauUuvXUGKOrc6d5
         ktgvbaMg/ugTLXuipZ+i/RICM64PZhxIZ79t2VCNJBDjdLsE2no7RHgy5r4VtnZYp5UT
         YYoJXfTiHA8alMleHBadNB6bddJSWs2q0OJiLnpqQtZ4e03khEH44G/gr4eJV/PRCwUa
         vKRK9PKCaon2R/xQWw82ZZNQWUcyLeLjfwZMPEMl0KC4lcZtlGi6IT+SAb4ser/+cqkt
         hBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945956; x=1742550756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/5asd/53euBM6bC34RrAlVW7qDAdZITZLPvtilAXu4=;
        b=a+PG1HRreNE/BPu329fbQIELnAmgptKJUwfWUmzSYyQQXrqWtskS1gTDPjC/hetXBn
         cKLvJ2lnrWQd+lTecyqjBi9h30rq+BJ0qTD/VkhAUYXs7QYW0vFuNzGbY2zHndvzOSGy
         ZhWF2KthNjaxhiA6A/UmhlBweGrrMY4I0GcowC7wWG1Z9t08Y6f7vFYZl7gc4J+ciZ+1
         daEAgcF3X/TYSEDLnZcGyFAOk483iNj+7kTGNLndP06Dgw9E3+QWQ1N2WNiaNRChRm2b
         yARP15p9pAWazWvI4a8XxVUH7eeeBCOZywTcMXrUdOvUXFT3d5HNyQScXvmFnDn0sk6z
         ZY2g==
X-Forwarded-Encrypted: i=1; AJvYcCVXABc/OIexsmlLgqqDSft8ySZZQT0Jk+Wh3Qc9dnAdHOE4djwnuZsU90Kde70cdLnipqRew/9du+Wx@vger.kernel.org
X-Gm-Message-State: AOJu0YyR5ifF8oWLJHG/zUes6AVifP4xjtfx9//fEqJVhEpbTq8jBibP
	+64wQB1UKSDHaxetMMBLkfmDXGp/Jxq94+yD2MT2KbiMT4zyzcB69oxZtURNACPr3+oGdzXj5GS
	S370xSw/Q0n7/McS56+ywLNCQg0VjuN70zRG+jg==
X-Gm-Gg: ASbGncu+ysKLYSHnyg3peZx5fcGsuWgQIEw3+fgnqsp8M84gxD1wS6SItO/kcQBP0nR
	AVhSuNKgM1BGjm6zEl+lGWF3+bW6OpV5//CBmwx8Qhdhs/2VYdUsuy2wayanyHHI1n4xm4A+/ku
	JzmoOUKqeiwAFVJapxS440gTZmIVxeQZ0eEA==
X-Google-Smtp-Source: AGHT+IE4lxhMdTrTNBei0n9rc34kAsgDuahn1/eTB9cagoZJUZxd98PK8/buazwt90bkSBJ617Y69C7NrOlBT+UFM+0=
X-Received: by 2002:a05:6512:3ba4:b0:549:b13a:5d7f with SMTP id
 2adb3069b0e04-549c39905d3mr580715e87.41.1741945956413; Fri, 14 Mar 2025
 02:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740823241.git.hns@goldelico.com>
In-Reply-To: <cover.1740823241.git.hns@goldelico.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 10:52:25 +0100
X-Gm-Features: AQ5f1Jpd9Gi4dE97J63cl_3Sj9zWgf9B4pm3B3hxaUcyuam3AtBeRqgiMrcUtRM
Message-ID: <CACRpkdYe5R6aAaeCAW2_cCA2k+m_kpPJGwZvgq_0Num9U04VrA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: ingenic: add support for x1600 SoC and
 MII and I2S for jz4730
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Andreas Kemnade <andreas@kemnade.info>, Paul Boddie <paul@boddie.org.uk>, 
	Tim Bysun <tim.bysun@ingenic.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, letux-kernel@openphoenux.org, 
	kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 1, 2025 at 11:01=E2=80=AFAM H. Nikolaus Schaller <hns@goldelico=
.com> wrote:

> PATCH V3 2025-03-01 11:00:41:
> Fix some nits reported by Conor and Paul during their review and add
> their acked/reviewed-by.

Patches applied, sorry for taking so long!

Yours,
Linus Walleij

