Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E17C1471F1
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2020 20:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbgAWToZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jan 2020 14:44:25 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45051 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728809AbgAWToZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jan 2020 14:44:25 -0500
Received: by mail-pg1-f196.google.com with SMTP id x7so1873645pgl.11;
        Thu, 23 Jan 2020 11:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=4hrg2EXxXIt/jm7vEqyCDsqHW6KXLArrF8vaL2xj9zM=;
        b=Qn+x4Duf0PeVI2r72OY7HT+iMB68K6e52UzTlns8uoL8IjVlwPLRpkyWEtjMREcMS8
         4/DdR6SzoHFe4uz8vyhIzrnQ5nEGuQeI0dxWX2udNhDOKJlfOx61pwIY5I45nnFDAmk1
         XoyqmAbtoi9r+qazo40h9420ExLdN/XJ/Y1idLbucuJS9MN/87Ah5FNXDGSjPWSkpWSR
         Gz8Ev38FNda+5FMPJX87NT8lHxhau0g8kPVrOmj+bPEFcxi19Uf8yWf3YlJI04FYG8cn
         v0IcgOsBdpAzxPbC92i76jX7okupZHcJUWC27FRmH0tXrQOzVmGcVvMVYIbftP9aprtU
         M9Lg==
X-Gm-Message-State: APjAAAWf0MwFgxvQxfYaVEVpQE2C6xtfxeIvDwouoiHYQ46bQOTuOA0x
        +8JBnZKcFrARKefHwgQ14N0=
X-Google-Smtp-Source: APXvYqyf6ckcpJZ57EZNrIrW4hzBZ8xfA2CCQSfzbXJikpf1CuUubADwGPms0r+nl5xkLRIZvswWnw==
X-Received: by 2002:a05:6a00:90:: with SMTP id c16mr8479835pfj.230.1579808664286;
        Thu, 23 Jan 2020 11:44:24 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id e10sm3644868pfj.7.2020.01.23.11.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 11:44:23 -0800 (PST)
Message-ID: <5e29f797.1c69fb81.d69bc.8e3a@mx.google.com>
Date:   Thu, 23 Jan 2020 11:44:23 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
CC:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: Add MAC2008 Support
References:  <20200113101612.38335-1-jiaxun.yang@flygoat.com>
In-Reply-To:  <20200113101612.38335-1-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Jiaxun Yang wrote:
> MAC2008 means the processor implemented IEEE754 style Fused MADD
> instruction. It was introduced in Release3 but removed in Release5.
> 
> The toolchain support of MAC2008 have never landed except for Loongson
> processors.
> 
> This patch aimed to disabled the MAC2008 if it's optional. For
> MAC2008 only processors, we corrected math-emu behavior to align
> with actual hardware behavior.

Series applied to mips-next.

> MIPS: Add MAC2008 Support
>   commit ece276de2a1f
>   https://git.kernel.org/mips/c/ece276de2a1f
>   
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   [paulburton@kernel.org: Fixup MIPSr2-r5 check in cpu_set_fpu_2008.]
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: Loongson64: Select mac2008 only feature
>   commit c9444384f0d5
>   https://git.kernel.org/mips/c/c9444384f0d5
>   
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
