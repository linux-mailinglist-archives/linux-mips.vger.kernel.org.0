Return-Path: <linux-mips+bounces-90-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7BA7EEE1B
	for <lists+linux-mips@lfdr.de>; Fri, 17 Nov 2023 10:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBC92B20A6F
	for <lists+linux-mips@lfdr.de>; Fri, 17 Nov 2023 09:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5C9EAF9;
	Fri, 17 Nov 2023 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXW2bCLq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C729D4E;
	Fri, 17 Nov 2023 01:06:01 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso1805700276.3;
        Fri, 17 Nov 2023 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211960; x=1700816760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrD8+qkSJjr9Q+fiMn2ZGucWuBAaYvxiKOqNR6fU0Tg=;
        b=dXW2bCLqomF1ugBldSMZ9p3D02VTxtwUdMsfkmAdvEQU9cmz3ohLkeqi9qJiebNIBa
         bHRKzGc6iza2+8kWPDg63zx5Gsnt8BTNbnYhuzYImPBSGdA6yJhkYed3jxdWphF/KvAS
         dHIgC8eI2mhHrJMA7Knteqd9Oa0Q5E59gir0kE90cDYgU/rv/Upm+CWclXYQqGCnWbn0
         2P4zfSLoy4Oj4Fx7KVUd6ll5spUkhYvy3CnDz5B4xKLbcq0U/WuzgYOFK4YLpigi1ps2
         chRIR+vOVoUoq/4JLjyEs1f8Zy1xynHTHIXb5+lstQL6Gwr6qmM8J8hduRzWiX23Jn69
         LTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211960; x=1700816760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrD8+qkSJjr9Q+fiMn2ZGucWuBAaYvxiKOqNR6fU0Tg=;
        b=voMT3M/k1DMMT092neCY5gNdb+kUY8HwBuXhqYFIzxqrl+kVjLOTfYUVpvNA2sAsnk
         KEc9g6bHKYidRmWEijpmtpUxw5NiUudCsLNWJSNHo51SjNVj3+gw+uiV45afxkuLgtIO
         CYYOVL8/WZyIH61Imx6cLaQdolBLMFERT5tMX0CUWz9WqWNvu8lNSMWCuMt0Jjj+pbHQ
         ZTn88HqKweqt2Uf+9jw2d8YNF/N08LwRNMty9Ng12jFbc3vsxEpwIYqGAYizo4uJ7qux
         GMO6602NyQVgn2PQ930MetRx3YTp4WfkuW42jD9qhwMt8IAuBCbqxKZPgP/H7LWoBMPq
         thyg==
X-Gm-Message-State: AOJu0YysG7Ie1k/8kevfc74gJDrOOu1Yb9gn0pzJYhHonBHmjLLIgDvp
	3S9EHVvm4YRes0mmmFR4eCP9rMEz1pmqlcdHpKk=
X-Google-Smtp-Source: AGHT+IEPixzhGpSc3tEVO8ZRFesnGrSzYBPawj/qAai8ntLRg9Ayp0XOI/51MrxatMcMZiHLvSJYqxEGgMe7A1fzuaU=
X-Received: by 2002:a25:6ad7:0:b0:d9b:4bfd:b75 with SMTP id
 f206-20020a256ad7000000b00d9b4bfd0b75mr15683441ybc.18.1700211960566; Fri, 17
 Nov 2023 01:06:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1699521866.git.zhoubinbin@loongson.cn> <84cb3df17eee993fc6a10e965b3f438f9034d2de.1699521866.git.zhoubinbin@loongson.cn>
 <20231116173907.GA2446677-robh@kernel.org>
In-Reply-To: <20231116173907.GA2446677-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 17 Nov 2023 15:05:49 +0600
Message-ID: <CAMpQs4KkOS1Eo-Y7=D2kP+yOW78zVN_7WDO_w0mc5-uaBGT47w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: interrupt-controller:
 loongson,liointc: Standardize the naming of 'loongson,parent-int-map'
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, 
	devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, lvjianmin@loongson.cn, 
	WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 11:39=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Nov 13, 2023 at 10:36:21AM +0800, Binbin Zhou wrote:
> > Since the 'loongson,parent_int_map' attribute naming is non-standard, w=
e
> > should use 'loongson,parent-int-map' instead.
> > Also, 'loongson,parent_int_map' will be marked as deprecated.
>
> Again, as I said last time, it is not worth adding
> 'loongson,parent-int-map' and having to support both forms in the kernel
> forever. If you can define a time that we keep 'loongson,parent_int_map'
> that's less than "forever", then may be it would be worth changing.
>
> To put this another way, using '-' instead of '_' is for *new* bindings,
> not existing users.
>
OK, I see, and I will fix it in the next version.

Thanks.
Binbin

> Rob

