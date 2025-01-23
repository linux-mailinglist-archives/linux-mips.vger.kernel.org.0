Return-Path: <linux-mips+bounces-7580-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB3A1A1B6
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 11:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5113AB6E2
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 10:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E531920D4FD;
	Thu, 23 Jan 2025 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILiLn5cW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFBE14AD19;
	Thu, 23 Jan 2025 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627572; cv=none; b=KFLkXnid7dG8FBFmBNXKH17Un9caGWSYCJ5aDxS827ErEfu0tylvAFbKgval7Fl/zEN2POcWnR0wueW+H8lSIh7V1MWTNz9ju1LVVeUiDMD4U3Ande/5OiNflv4kZRkNlZSHBrB2bZOXhBztjRIxIpDOBAn66v/5ioau7UKQMy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627572; c=relaxed/simple;
	bh=qbpoKDddi362Sy79+0mWxpFtU06yaHegDxpYwpUh0XE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKFVSpIZkmQib023qFKWU+jEbjKnmaBeMkpMLjpFUuQ9Wb6ve9JtHU75caUOyOqeu128Iw5bR0vUb9VAOPXHb/mgvkYgqNWBTsc9ENVAHJOLfqYUKAlBE+4D2muDnS05MQi9I5/FvkqsJSZbFslhFnBzSgZ7CShkxzPWkcWSyvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILiLn5cW; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b98a2e3b3eso35275485a.2;
        Thu, 23 Jan 2025 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737627570; x=1738232370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbpoKDddi362Sy79+0mWxpFtU06yaHegDxpYwpUh0XE=;
        b=ILiLn5cWlxaC7TkTCefSQIwVdDlBtYWWwDuBdIu3Y+zg+VOZ1rg1qIs9i7oXzlcYwh
         aCFgie9LK9dtjuvZ4Q436tPqcEIk6ssWGNWxS7D4MAVOuduE+wWyQ8CaZlxiVDf4eUJS
         bB8ImR44JLz9egNTC6XPy+nHCkCJ7+cdvtIAedlVanFpYFzStqIj49tOmTbqQbZkYd5K
         Uh4dmJqyW8yLqXzogqRlJ2Ru7BE8NjJnHF+jB1JfVGImVCit9+ZmmR/ms+48wBcveBc9
         hlIvOmJ404jR61gDAUWS6HqcVa1Z0IIM+itP0cFZt0/7hmeVxSxSuahUmJR8ROxgy/8K
         +MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737627570; x=1738232370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbpoKDddi362Sy79+0mWxpFtU06yaHegDxpYwpUh0XE=;
        b=w5Q+DtQx14mxmf9GcZz8LWFoMsWBqKvV8jLCzMLfNGJENwRXnWSxl/xIp3I44Hye1o
         6VmKW2h9tMVIS/XEg6NlytZlB/P74xBhRQxv8NXQZpJqiCCTnLm3t5eHCVcj0cpHcCnc
         PKVwkEj7ygmvKRiYuTeEhIcTCGYmZ2OVuiZjM0/NKRmlpTBv8BBh06de+4UASpw7QdN6
         lquHBn0IKBeEiGF6Y9qfpVaG3G4iRv5IHHsTWiKtSCz80Rn1IGJ5KYkc6rDwciby/cnx
         L4/nRF+zMegwr7KA46+e9W9r+/ekXMyql7IWAPX/2NLDXth5nSi+sZluOinXdHvSNOdm
         T1eg==
X-Forwarded-Encrypted: i=1; AJvYcCUwXCs+FpO9+/wygEV8Hhyf1TovYQexdTMYoC4HqLkWY0YlfiMaA/pUa2Z7aN1EJO+/M/z8U8tfcxfo@vger.kernel.org, AJvYcCV4aKZ94S5+tOswJrGSETQXGRq2+P86EALtkgerYx+uAtn5EYQmiED/qCsRXeF52NWjcEoAjs/WcxAmDGP3@vger.kernel.org, AJvYcCWEHTtIjqgyTYqJNj4woNkxUXx9M5POOnR0i5gBXN+WsFqQcBuZd0qJn4WFgRr/uuj99RVEYBwNHtCaxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyFwL8B6zN/7XkvzwUhrhJYOLOjrWc5GYZwed90YZC5nLMsq66
	YV1BFMD5HiOE+NK6f9DjoCTTS1qd06oVhqxSY94RcZnBF1ECotWq8deoPT69Z1pdC7Kv6ce35ea
	ApMPnjythLPO47In3NW2IO3HsOVo=
X-Gm-Gg: ASbGncsoh3yHyqQoETzN/L9hinke7sBpe0WqrVEcR7NOJ4Kzv4qsjynTBuqbk3Sz3fI
	yTw0JePteR/RhYTjnyGiE9xibyaj+Nw8JvjxGrqkBC023+8Hr27yPtQo5j455BWI=
X-Google-Smtp-Source: AGHT+IE3ApFWnXNjyAzEBLDjCwvKVt3XG27QuphNd6AZj2pIwExOdYR4bhFPT8VmeyAd+0Z5nJnC7QsQL4WAeCPCJBU=
X-Received: by 2002:a05:620a:468a:b0:7b1:543d:c99 with SMTP id
 af79cd13be357-7be632024ebmr3682303785a.24.1737627570078; Thu, 23 Jan 2025
 02:19:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028175935.51250-1-arikalo@gmail.com> <87ed0uvqf7.fsf@BLaptop.bootlin.com>
In-Reply-To: <87ed0uvqf7.fsf@BLaptop.bootlin.com>
From: Aleksandar Rikalo <arikalo@gmail.com>
Date: Thu, 23 Jan 2025 11:19:20 +0100
X-Gm-Features: AbW1kvZBOb2fecymAIB3ioxucNgvNDIj2lpX15S6YQDnZ88q2SUMY8BIT2Tf8R4
Message-ID: <CAGQJe6qBpQhBwhoLss8Y4MRurRs2p6_vym5XAiMmnHqd=nQC8w@mail.gmail.com>
Subject: Re: [PATCH v8 00/13] MIPS: Support I6500 multi-cluster configuration
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Theo Lebrun <theo.lebrun@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Chao-ying Fu <cfu@wavecomp.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Paul Burton <paulburton@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Serge Semin <fancer.lancer@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 4:06=E2=80=AFPM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Hello Aleksandar,
>
> > Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> > Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> > 1 cluster/4 VPU configurations.
>
> I tested your series on top of v6.13, with some patches already
> merged. Only the patch "[PATCH v8 09/13] MIPS: CPS: Boot CPUs in
> secondary clusters" encountered a merge issue. You can review the fixed
> version I created as an attachment.
>
> With the v2 series I sent a few days ago, cluster support continued to
> work on EyeQ5 and EyeQ6. However, for specific needs requiring support
> of EyeQ6, I will send a new version that takes into account the feedback
> received.
>
> Gregory

Hello Gregory,

Thank you for your time.

I agree with the change in the attachment. Will you send it to the
list or should I do it as a v9 version of the series?

Aleksandar

