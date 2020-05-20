Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84521DB35D
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 14:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgETMda (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 08:33:30 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17708 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726868AbgETMd3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 08:33:29 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1589977932; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Ik0Yigs8kImtKhjXZnlMAInonF7b/WsWonJh+gODoNZXScAlhj+leFUpuOQGOFU2QVL9m0hstajj9njFXh7BeEZaD+0c4rMG0bmZ1bVV4eYTYBdiYHVXXU+dbZpfnZMHhqZzKu+IH4SW6Yfa6ycINAoyAeAUkFgTsG7I36u/mbc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1589977932; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=TJqmWfeUuN5LE75nul3wH3FZ6nQ1yQSdQfK6PtOHOHs=; 
        b=O2Au6E6yKNllX40+daihOylvmzJCdZenyqgJHZaYbeCGZvSlQ5nEjMfUDwDKkZjsYDs8M70ZoKeYOuT4P0dGYpi2Pgv0TRAPtO714bx/bs3nFrIbvdEwcTjNi5Xhvz8Lz0dmIyfboL2mB4nLD+YDyMnSmmGYKXW3n9gpM22f3ik=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1589977932;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=TJqmWfeUuN5LE75nul3wH3FZ6nQ1yQSdQfK6PtOHOHs=;
        b=FPh8G8GY+zJnnKuDxur7rUuF/DurU4V4e9Wx3Za4T0yrgFvXXKgl8Q/MJRyK+zby
        5p529MSsXY5b722bnTsLlU5d6PaW5DfyXR+SCdodNEMEmHQY5Ntpxo1uvU3c+Uo+1jj
        M5MLJ7GLWH66SmoY4v3+X+wGHp0Sz5Tasa2+cKw8=
Received: from [127.0.0.1] (223.104.210.187 [223.104.210.187]) by mx.zoho.com.cn
        with SMTPS id 1589977929817309.0615537915593; Wed, 20 May 2020 20:32:09 +0800 (CST)
Date:   Wed, 20 May 2020 20:32:01 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        paulburton@kernel.org, chenhc@lemote.com, tglx@linutronix.de,
        robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, krzk@kernel.org, hns@goldelico.com,
        ebiederm@xmission.com, dongsheng.qiu@ingenic.com,
        yanfei.li@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: Re: [PATCH v8 1/6] MIPS: JZ4780: Introduce SMP support.
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <M3OMAQ.GEVVI159THK33@crapouillou.net>
References: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com> <1589898923-60048-3-git-send-email-zhouyanjie@wanyeetech.com> <M1GLAQ.UK9S5G64TOOO3@crapouillou.net> <5EC4DADD.1000801@wanyeetech.com> <M3OMAQ.GEVVI159THK33@crapouillou.net>
Message-ID: <13934660-2138-489A-A87E-A6AA222F6218@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=887=
:33:22, Paul Cercueil <paul@crapouillou=2Enet> =E5=86=99=E5=88=B0:
>>=20
>> Yes, the current way is indeed a little problem, it will cause=20
>> num_possible_cpus() =3D=3D NR_CPUS, I will try to find a better way=2E
>
>You can do:
>
>for_each_of_cpu_node(cpu_node) {
>       cpu =3D of_cpu_node_to_id(cpu_node);
>       __cpu_number_map[cpu] =3D cpu;
>       __cpu_logical_map[cpu] =3D cpu;
>       set_cpu_possible(cpu, true);
>}
>

FYI: There is a abandoned DeviceTree[1], parser=2E You can take it=2E

I'm going to submit this topology clean-up for next release cycle
but you can pick it for now=2E

[=2E=2E=2E]

[1]: https://lkml=2Eorg/lkml/2020/4/11/1088
--=20
Jiaxun Yang
