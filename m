Return-Path: <linux-mips+bounces-9732-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D052B01150
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 04:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E53375A746E
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jul 2025 02:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECB618FDBD;
	Fri, 11 Jul 2025 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qnfi2vVi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAC218DF6E;
	Fri, 11 Jul 2025 02:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752201574; cv=none; b=CbDdXn/a6u/16pncw5c9bRo9lYYFMcNWEqFP0XDmgao7GZR9Xz7LCQuB7m3RW8FtLUr/NP5UmWeFiXAcT6cMV85tiL3769MLVUcfhnERVG1nuOWSJBiavlU4qnw0xryFxkdMAaW0Hg9ECQ+vcyY5fBixpRcHmWXr3+mZ8St7WQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752201574; c=relaxed/simple;
	bh=b8SXmUk34NlTJ0OPMnPfP6dSsyuT4RLa0qZZqAuSzrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKOUGawytxPAb+ZiCv4Vdqp3W8fORswHi2RIe2q/7GvLJmRq0AiLhms4R66BIpAvSl6dE+IJibzQQp40gQEO5nh15AngqnNkSa20VymTK294cEmXtSmEEr2Ktvx10xZTiSpJ/t18IomJGyc3S4VKH3pqrdKSfE0kcGHOAWAfIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qnfi2vVi; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-558fc8f0750so1994498e87.2;
        Thu, 10 Jul 2025 19:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752201570; x=1752806370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YhjQC50gah28UyUV1gJ4N7IPHgzmfVNY2YtsOVSd2A=;
        b=Qnfi2vViXrp5bgEB+xXxgLAIybyKDDAA/mta89FVhrXPs2mAPEyJ8HoW9IjZU6fi2n
         XW1qxY0Ljt69EOyU3DGRT4KOGil/wJGhlsoS3KQMNkbIO3thv2h3WcHzSzNZgq80o5BS
         tNM9CPVjofQ9Qt5ahBXVaKXzkjidTPccSJ+r2TiY9MQrHyk3KYbOzUmChefCRbM0iug4
         RGKx44wg+cjuhZIBKyU32j/ZZDtx1zdYHp7LoSzbGpxYwSBvqIGshy0CnF9dNejURAJN
         p7NFu/GYadgpd/E3Hmd+rCkF03M9fiRCpBJL1Jv05no5PE9732hTiq6uwLtqCf35pLpk
         aIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752201570; x=1752806370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YhjQC50gah28UyUV1gJ4N7IPHgzmfVNY2YtsOVSd2A=;
        b=b5KJF67XGx3dfRSjlt7Mg7l0sPGhQb1mjiBlt635yheeVdGCWrmX8JjjaFPJeBa1PY
         UL5OGJOwANYJHQKthhPObRykzbX8PB3sCzjG1z2fr9K7EphFmqIpE1Z+Ixfv/ra2CEc0
         vVG44rRdvv784EZ9N4xxHsa/uFtHY81H7t5jl6O/SVaYkCut6qWvf3gfU6AvBdXilcyT
         DtvgEiPQkzQk4N3bWgM/pLGCWGKkgWXK81VqUHTjioW76Eg5gDZEdMaAJ9yGO3dSYxff
         bJ4LSHZSppPXYAQEQlM439MWXxQ3Xnl8YLKydPdkbwRcO61LPMOPve2RyuYL9dk6tfdj
         CkZw==
X-Forwarded-Encrypted: i=1; AJvYcCVrxC9TvN3A8xFMT/uzm33oT+wC7gtCsQfIytidzNWyj7xE49FiTCAtcZo7aWE4iqGW5fRY5kK9sDKFUFJe@vger.kernel.org, AJvYcCXGr2R4ZDp8ehVZ17iXcGfq+ickHABSM0vf8DH7YDAwlkD3VXWQu7tD+tMtnqbuVQRQj4rdBqUXsODX@vger.kernel.org, AJvYcCXIVQoY6T5A3j7Z7lRildZLnv9uVtT/t/kH7LTZUDWqVk8zor7MsKw31Xv6wHimnAXpdw5obCyyq5W1MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySrUvqw5ERF67sruYmhXKfV040+AS2Q2T3DwNNjWxfOMkcN9Vv
	o3zl0u5uETN7yxTpL5gyCTWciZiq25u+40bzbEIV3azJZSsW/yQKwGWTnINYPIp6nK4GoMjPIEV
	2qokIDaSkXPJn/29jyBxqU+StX2niyBFeEglQ
X-Gm-Gg: ASbGnctlBhcwuCwObcrY8jwxR0xgR2ISllV4LGiDMlA0p45tHfDJRZvC3fT0docHARg
	enymYfRPjBoTxAGVtAFFa6Gub4od4QhmOqtQwryfZfmZE5TeP9AdLWl7MAjCc0EassQNJQYcQTw
	RL6s5NgLHJXxC9isdOYxnjZxisiWm+JBCyRiTSjx5uUXLhMsiznThFD1ofRAqwTWfB1oC//advH
	M0QZSwTcd2IJGugKrM=
X-Google-Smtp-Source: AGHT+IESn6qKVxd0vG6t1V/8SUoZ0k1VXjtTG70YEDSMjsJpp9rx6UEk1qV6NnTIFS2ypnhbddHk0z7SktgyFPjIPeM=
X-Received: by 2002:a05:6512:23a7:b0:553:2f33:ac04 with SMTP id
 2adb3069b0e04-55a04608eb9mr361877e87.26.1752201570073; Thu, 10 Jul 2025
 19:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
 <20250709-loongson1-arch-v2-2-bcff6e518c09@gmail.com> <20250710-wondrous-nebulous-ermine-9c3fdb@krzk-bin>
In-Reply-To: <20250710-wondrous-nebulous-ermine-9c3fdb@krzk-bin>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 11 Jul 2025 10:38:53 +0800
X-Gm-Features: Ac12FXxHPKpfDBJJXc2OWsPjPNQXwhmzLcqR8m1s2IlT0rZkvWQ4t2-7jNQDtHY
Message-ID: <CAJhJPsXOREQE43tq+6pUyjNxM6J=4D8m4jVBsZL4_XjQA=58nA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: mips: loongson: Add CQ-T300B board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 8:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 09, 2025 at 07:05:53PM +0800, Keguang Zhang wrote:
> > Document loongson,cq-t300b, a board based on Loongson-1C.
> >
> > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/mips/loongson/devices.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Adding these one by one is quite a churn. Just squash them.

Will do.
Thanks for the review!

>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>


--
Best regards,

Keguang Zhang

