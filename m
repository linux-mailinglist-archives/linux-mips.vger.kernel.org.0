Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A5E1C22B6
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 06:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgEBENi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 00:13:38 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17759 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726439AbgEBENi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 00:13:38 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588392807; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=TcDizgMTnejLcEfd4ypPYU4q9usD4QnmRub5jE+jgB7fXg1YHz/u2uSG9wAYMCwtQhvWg97s4tOIf9HAtOxO/+v+iWX08GG3mKZvLMwApY4+gY+3bdSm2+tChH/MuaLIBNyVYxn1/dhmEsNFRU5XjxJQuc0c/FJqttIsFVlPFZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588392807; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=kIxq1SPrgIu4nogqTHMZhidpoyXBFul+evVc6olbwoE=; 
        b=Rm2S+PJnME+Uqe8ZCh3EPPrn+Ig0BF9D78L9d/aonASGpJBwF6Fua3rrDXMqhCOmtLyFtJMS1TGRwy2aBdhui+Xjv88MeGJdtiqcNZVcwYuJx6HlQ9bx4nsvDv4gmOjbhXiZndrqOH9joqSdBTXP52FuaaFLqYOiqgKijli/bBI=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588392807;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=kIxq1SPrgIu4nogqTHMZhidpoyXBFul+evVc6olbwoE=;
        b=HFQSxAt/nnNY1kc0tZe5Y61+ApnSNRbNtMa0GlWy5oiXS05eD/9BhZ6tvBtfGjC3
        en8KwKXSij6rwVsND3qMsNT2HpkOflZkZ6YpIfOBx+POFtYwrQ8a0q99Y3T8cxDPIuK
        N4FLcOXLdYJbMAzJla7fS8oBwoGNoP5ggbhkSjFE=
Received: from [127.0.0.1] (115.205.241.207 [115.205.241.207]) by mx.zoho.com.cn
        with SMTPS id 1588392803364372.4090948613691; Sat, 2 May 2020 12:13:23 +0800 (CST)
Date:   Sat, 02 May 2020 12:13:19 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] MIPS: tools: Show result for loongson3-llsc-check
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <1588391701-5588-1-git-send-email-yangtiezhu@loongson.cn>
References: <1588391701-5588-1-git-send-email-yangtiezhu@loongson.cn>
Message-ID: <4851B907-6C9E-463B-ABE0-4588DB0BA748@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=882=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=8811=
:55:01, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>It is better to show the result before loongson3-llsc-check exit,
>otherwise we can see nothing if the return status is EXIT_SUCCESS,
>it seems confusing=2E
>
>E=2Eg=2E without this patch:
>
>[loongson@localhost tools]$ =2E/loongson3-llsc-check =2E=2E/=2E=2E/=2E=2E=
/vmlinux
>[loongson@localhost tools]$
>
>With this patch:
>
>[loongson@localhost tools]$ =2E/loongson3-llsc-check =2E=2E/=2E=2E/=2E=2E=
/vmlinux
>loongson3-llsc-check returns success
>[loongson@localhost tools]$
>
>Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>

Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

Btw,
Just learned from Loongson that the latest generation of Loongson-3
doesn't have LLSC errata, also for Loongson 3A R2/R3, use synci instead
of sync would give better performance=2E

For performance approach, we'd better develop a method
to enable/disable these workarounds at runtime, looks like smp_alternative=
[1]
that was already employed by x86 and arm64 can be ported to MIPS and
serves to this target=2E

I'm struggling with device drivers recently so wish somebody
can take a look at it=2E

Thanks=2E

[1]: https://lwn=2Enet/Articles/164121/

>---
>
>v2:
>  - move "returns" after "loongson3-llsc-check" suggested by Sergei
>
> arch/mips/tools/loongson3-llsc-check=2Ec | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/arch/mips/tools/loongson3-llsc-check=2Ec b/arch/mips/tools/l=
oongson3-llsc-check=2Ec
>index 0ebddd0=2E=2Ebdbc7b4 100644
>--- a/arch/mips/tools/loongson3-llsc-check=2Ec
>+++ b/arch/mips/tools/loongson3-llsc-check=2Ec
>@@ -303,5 +303,7 @@ int main(int argc, char *argv[])
> out_close:
> 	close(vmlinux_fd);
> out_ret:
>+	fprintf(stdout, "loongson3-llsc-check returns %s\n",
>+		status ? "failure" : "success");
> 	return status;
> }

--=20
Jiaxun Yang
