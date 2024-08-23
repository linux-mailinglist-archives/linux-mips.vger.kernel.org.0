Return-Path: <linux-mips+bounces-5040-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6A295CB67
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 13:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52B7CB2342A
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 11:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A399187347;
	Fri, 23 Aug 2024 11:33:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62550469D;
	Fri, 23 Aug 2024 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724412802; cv=none; b=V4wa0ECjdIexNXCfGo0IJ9Vs/h9r/0RFzcM7dIHEtcLqwXGLP7pm9u4SCnRcUhACOg60nuPMHX9i96iLlz09YAAiY5jZCwHlrRxSghuF5PknFYbifcATOAv8tKSihzhU1zKCMV+gPgu6LSlx+0BY161y8FDUD0SSfEWqL7eloP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724412802; c=relaxed/simple;
	bh=MYWc08SH5BecBkhgukAeB7AhxRAa8T75qBYSHugkffk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCOrXsp9BtNLD5KEBIe+k9iSnLNp/4cSmWlzSvcQ+QNr4koEYTYZKr/ptcwXJ4jsxwiIW6MAuqc8LxKfATBByk1Hom8Glh+4nCpJh5+u1SeShsNtms44yG1BseEDl37JuiVELTIOmcmLwwlVXqvDa4JqYpMENvT+aJAPyxX3+v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso1810295276.1;
        Fri, 23 Aug 2024 04:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724412799; x=1725017599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMEH/Ww3lGUsG6S84gzaZZHFTkxZjOmIG5r+YsgcND4=;
        b=CABLwoeBiAEhrSsmgWzxWs8uwawnz/z3X1RXbVZgQsY7qd3rwmHrMYSc6AgyYDe4/r
         eB8HDrHJiLiXcUKj9qfpipe8bg95MSCLuNNasceRi1ch9/bf9jYj9xitqXjZAf7/XBpb
         W61hCVwMckFS15NZOn/8lG6byxPOT5GVidjQ8u3nf/SxkKpK4tm42U5LUSsFzLjBZrkT
         tTrceHN76rDKoLYadBznX6AfdZZOKrLcfupaKc/f43D3drkjgoPQr1Uq1fTYXiQjD0ru
         EhWfAkvIkxN9g1Z025SW100syd7ZNLHmNsec7/ouauL1C+IcGIj2CRrvjtQhQye9/i+B
         +mVA==
X-Forwarded-Encrypted: i=1; AJvYcCU/obGXmEMuj4fI5jsqN7KheN1PWYmMjRykI/ZBbPhQjdZnY3LkTmTDmZu8+t0MogWnd3A9ZKN4J68f@vger.kernel.org, AJvYcCUtrh3Z6XGg2F7imVVKG58xvCppLxM2+Tr7nbmnBhWObkEEC9YJq27EC2oSQALDf685oa2KPqNDWwSB@vger.kernel.org, AJvYcCVYjlIy3S/v6SWG9VdXaJVjSaKgHxmCmNNKgtw9lJ0SEtOzVuSBV/bkmsXIJ0JTN/jp+YRZ2rb+srGkayTD1F5IF1M=@vger.kernel.org, AJvYcCW4wQGeq/QA+CvDenKJSrwOvY+B2nQhAgKs8L1o5qac28cTkBtXLXagZsJm3M+AsqIjc+qkrNvVh/CdfQZA@vger.kernel.org, AJvYcCWuTLOy0UwJXCs+ANqwBL16CLZ6CNFNa6zjWnpVViZb3gPIUgLCnv3ZKp+LDDGIIhmPOwJZJrIwSxqD1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQIX2AuKxWo4nVhsT/721s44ULwpBDplrv47dR5bMcvboIGd86
	Ddqyl8wKKbwn17hNEaC9lDoWdS16xqGJtuEuvgrD1ZkA21SB1E1NqlAXbZza
X-Google-Smtp-Source: AGHT+IEnZxUkU1g7JsD5zCnGFlJC5Gwv34A5kNnddRdT9jR6pu8gQlX3tvTFffTaYjpIbUZT1CgGgQ==
X-Received: by 2002:a05:6902:2409:b0:e0b:d6ff:45a8 with SMTP id 3f1490d57ef6-e17a83d6786mr2049715276.20.1724412799126;
        Fri, 23 Aug 2024 04:33:19 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4b42ccsm621392276.31.2024.08.23.04.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:33:19 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-69483a97848so18964377b3.2;
        Fri, 23 Aug 2024 04:33:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6IujzqH1IT581S0u59uh5xQ2hK1r8+BnDI3CEMTuSngCXlywV3cNIxe+H6J5D/A+c/zjAOP3kmS3NQA==@vger.kernel.org, AJvYcCUovwZVtITfDADWGPiKDD1mAlQ/jspEbMdidbVxY6rM2W2+xz9kEeFSRIZ548LeLWO2uoW8TOAToQjqPT4FU2kbw+M=@vger.kernel.org, AJvYcCWcJAZBNYV+3KyFZi2C+1mW5abvKuJ+LrhMvdvmbhT7xXD3jgSQL+qjK+3erX2Ie8Gb+j5hLeb165ng@vger.kernel.org, AJvYcCWcP/bbrGYYDxaU5tqmxHTHAFNNCgRZ5Clbt7UUK5gnUbGi6fynwVo8HTYpsFJKUxx4pX2XDF1q3hwz@vger.kernel.org, AJvYcCWj4UAdkaW6OHjqk4/qWet9p8CxPl+PFMQ1CLdVM2ZkL+0tZSBj1cPDjstguQ7kPi9feFFgmi0HNn0915Ul@vger.kernel.org
X-Received: by 2002:a05:690c:2845:b0:6c1:699f:cf8 with SMTP id
 00721157ae682-6c625e27412mr19164117b3.14.1724412798745; Fri, 23 Aug 2024
 04:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org> <20240818173014.122073-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818173014.122073-3-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 13:33:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXT2r8mTOye5S4JKZbXcBmavwrP96oe5aVnORm8UUqONA@mail.gmail.com>
Message-ID: <CAMuHMdXT2r8mTOye5S4JKZbXcBmavwrP96oe5aVnORm8UUqONA@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: clock: renesas,cpg-clocks: add top-level constraints
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, patches@opensource.cirrus.com, 
	Elaine Zhang <zhangqing@rock-chips.com>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 7:30=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-output-names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

