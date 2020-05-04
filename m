Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D122E1C3F74
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 18:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729207AbgEDQLm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 12:11:42 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17792 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728764AbgEDQLl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 May 2020 12:11:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588608593; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=i1zTiI6vQghvIRHWFVdCr6eMjt1Ty9sIUKZBB/8sWC/Qe60kjhy3CSjWRhYXApUh7r6sT4T7bvAvdOlU12tNkmSzCqYwaabr9xBSF4kR3rCx9cU/ddUAj1v7R5V1C1q40GPZrd5I4r4rJHHwPNo1fbHCkQSP95WVMflchxDnY8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588608593; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=Zitcy+9ai3qswjZX8GUqfMPQ7VUOo/hNsYYroSdp8Lg=; 
        b=EcE/a6whG8qDaLcAKAHNfA7T1m4PJ6zDEs6+/4YgpKO/5j98aD0D9Hk1zGAU91NX99hHLxwB50OCHFAPouagsq9muVi14B7UTSkxr0QdTOF7eD+BEanTp0tNfTQ+oFcgUdUtfuIS1EHXhLut3LEFmBRqiNkwo2Y33LDuXfp2aEw=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588608593;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=Zitcy+9ai3qswjZX8GUqfMPQ7VUOo/hNsYYroSdp8Lg=;
        b=BtRBiszWw5dfPcbvDGjHEGdvN+ti3w+bi1DYWMGP3kc/HOOFR+QdPVWaen9sXnB3
        k6udqdFCFAMPIStrKkIKPix1tCSIoEGmVd/luydwI7jqedolovnbMBlrRvUwSp6oFH3
        G2gLYr220qIjZkyqWk+8cmOe15XnRwE2JwgYoVZs=
Received: from [127.0.0.1] (122.235.211.112 [122.235.211.112]) by mx.zoho.com.cn
        with SMTPS id 1588608590197451.40427373256; Tue, 5 May 2020 00:09:50 +0800 (CST)
Date:   Tue, 05 May 2020 00:09:46 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
CC:     linux-mips@vger.kernel.org, clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jouni Hogander <jouni.hogander@unikie.com>,
        Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] MIPS: Truncate link address into 32bit for 32bit kernel
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200504154613.GA14031@alpha.franken.de>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com> <20200422143258.1250960-1-jiaxun.yang@flygoat.com> <alpine.LFD.2.21.2004230036480.851719@eddie.linux-mips.org> <B307BFAC-9973-4444-B69A-40B054210E84@flygoat.com> <alpine.LFD.2.21.2004241316360.851719@eddie.linux-mips.org> <20200504154613.GA14031@alpha.franken.de>
Message-ID: <86D4A0AC-59E1-4C82-B66D-6BFC71E08376@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8811=
:46:13, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=88=
=B0:
>On Fri, Apr 24, 2020 at 01:22:30PM +0100, Maciej W=2E Rozycki wrote:
>> On Thu, 23 Apr 2020, Jiaxun Yang wrote:
>>=20
>> > > Alternatively, have you made any attempt to verify if actually repl=
acing=20
>> > >the setting for VMLINUX_LOAD_ADDRESS would be safe?  Glancing over i=
ts use=20
>> > >there do not appear to be many places=2E
>> >=20
>> > Limited experiments showed it should be fine=2E=2E=2E
>> >=20
>> > But MIPS kernel has some design I'm not really familiar with like SYM=
32 for
>> > 64-bit kernel and special address space design for Trap-and-emul KVM=
=2E
>>=20
>>  This only affects CONFIG_32BIT kernels, so SYM32 does not apply; I can=
't=20
>> comment on KVM=2E  There's still that bunch of:
>>=20
>> $(shell expr $(=2E=2E=2E) \< 0xffffffff80000000)
>>=20
>> constructs I mentioned before, so let's leave your change as it stands =
at=20
>> this time=2E  Please do rename the variable as I suggested though, I ho=
pe=20
>> that's not a big deal=2E
>
>Jiaxun, are you going to send an update with this change ?

Sorry my mail server missed Maciej's reply=2E

Should I send another version or you just fix it at apply time?

>
>Thomas=2E
>

--=20
Jiaxun Yang
