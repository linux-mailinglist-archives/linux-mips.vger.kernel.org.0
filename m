Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3099A6E9C79
	for <lists+linux-mips@lfdr.de>; Thu, 20 Apr 2023 21:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbjDTT3T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Apr 2023 15:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbjDTT3S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Apr 2023 15:29:18 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A312A40E8
        for <linux-mips@vger.kernel.org>; Thu, 20 Apr 2023 12:29:16 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id BDCB132001C6;
        Thu, 20 Apr 2023 15:29:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 20 Apr 2023 15:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1682018955; x=1682105355; bh=bzWIFI7adxsIgPHeWjdp1n4RiPa/L+7Z3IZ
        TBc/4acU=; b=bZNhFZRbnlwOFwR+GVgJqSJme5OYQ/iMTgevJwgkTm14bDqKa6o
        O2S5bDckPXI8ZAiv0qSUHI7Ol6uUUQj9lcSBuVi8C4bOoo++4WS8oDtTj5mlzHWJ
        kYAlbSo3pjuYcrKPXN/AL9f7J5k9JRCeQJRhEujaJUUJSlr/nJE49+6VfUM2RdW1
        YjqgPoOUjCDox0YkW9ffGhmxECGQRSBiQGLNogodYNMo/offO6omgSkDAaC6En0v
        isGd3w6M7YN2f68l17PdNLz1lfsEQEmelO+RbRVvtjfX+sCMTAnYuKxXQzBTSps6
        HtZklDCsRQYl+74lM47Ja9yCDSSaQ8rPctA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682018955; x=1682105355; bh=bzWIFI7adxsIgPHeWjdp1n4RiPa/L+7Z3IZ
        TBc/4acU=; b=IisMTA+YUBApOd+OQt9i7bj9uDMoY/FVjWhVe/6m8I2+aDIvgQa
        u5HJIUtUBbtJK8SZ/ClmRm+BR/SjgiWIMNINFWMzzF91N7Y11Iej+KbQMV11Br3X
        jVLR7v0A8LMoGA3LADJ2Kvw5BRuX5KrZ0qpB2n+UD3UHsCz8Wt3dTVzjzHLfy5qu
        hmcWGHzxh7dhFEvyIfBGm4/LtrEljqkQrci+F8Hm3PQYoCBPNNKp7sYSwPeZOOln
        fWT2HK61M79wt4oaoDT/jU8xsNr+8u/QruE3IOLjrcXSzXgaxs7sDNiSw63GuROv
        BAu/KnDCK2OziQPQTP94Uv7VlkTLmZaNlNw==
X-ME-Sender: <xms:i5JBZAIqgHu6Z-2tqID1w-z_icQglsNXHfzDRvFs21F5qt-tYKVN_w>
    <xme:i5JBZALLHXlX1-44fVnw8WC05MJ535hMZIwqezQpMbPmDx172i7zUtYFmHQDaGfBn
    zpQDyHQ4qXFRahLjMI>
X-ME-Received: <xmr:i5JBZAuUSy9dwUvs9C6WMxOYSWKe1FB_fv02ISBcVJKqm3AZ0yCemJaYkr0uzdSeAnPR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtvddgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:i5JBZNZWN1PPIwROud30NG8nl7rVUjSgt9WuExauNjLE7bCkI9SkSw>
    <xmx:i5JBZHYBIAQHNNEf9RqqMuFszsN1qtasEDHw_0y2k8phyQPnYWIOeQ>
    <xmx:i5JBZJA_n7Af3rjEIe6aMZYceM0vPRjR88RM75yhThaXEAPWpA5J5Q>
    <xmx:i5JBZDEHejK-jQvZ8lmyLsRmjahaL461cQzTxuCdjlHiAWQhK5XHrQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 15:29:14 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 1/8] MIPS: Replace assembly isa level directives with
 macros
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAKwvOdmRobqFrnZ70ODzdMfp4A-Br0mHhRkEnmTrkyk7CmiERg@mail.gmail.com>
Date:   Thu, 20 Apr 2023 20:29:03 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FEE1072C-2228-4B2E-92C0-760F0B471D04@flygoat.com>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
 <20230409104309.13887-2-jiaxun.yang@flygoat.com>
 <CAKwvOdmRobqFrnZ70ODzdMfp4A-Br0mHhRkEnmTrkyk7CmiERg@mail.gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=8820=E6=97=A5 17:43=EF=BC=8CNick Desaulniers =
<ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sun, Apr 9, 2023 at 3:43=E2=80=AFAM Jiaxun Yang =
<jiaxun.yang@flygoat.com> wrote:
>>=20
>> There are tons of .set assembly isa level directives in tree
>> to set current isa level to a higher level to enable some features.
>>=20
>> However as nowadays MIPS is shuffling around opcodes, a single ISA
>=20
> What do you mean by "shuffling around opcodes?"

Newer MIPS ISA (i.e. MIPS Release 6) had changed opcodes for some =
instructions.
Mostly moving around opcode fields.

>=20
>> level setting may result wrong opcode in binary. We had =
MIPS_ISA_LEVEL
>> macros to determine most appropriate superset of ISA level, just do a
>> tree wide replacement to take advantage of those macros.
>=20
> Hi Jiaxun,
> Thanks for the patch! Do you have more info about how this change
> relates to LLVM? Is clang having a hard time assembling some of these
> files with the given `.set arch=3D` directives without this patch?
> Seems perhaps related to just {mips32r5, mips64r5} perhaps?

Yes, GAS and LLVM sometimes have different opinions on what a =
instruction
feature should belong to. Personally I think there is no right or wrong =
in most case.

So generally when we try to use some inline assembly features that =
toolchain
may consider belongs to higher ISA level we will use `.set mips64r2` =
directives.

Having this patch just unified the defined arch across the tree, so it =
happens to fix
some cases where `.set` was given a improper option.

>=20
> More comments below, inline.
>>=20
>> -#ifndef CONFIG_AS_HAS_VIRT
>> +#if MIPS_ISA_REV < 5
>> +/* VZ ASE should be able to work with Release 2 but LLVM thinks it =
needs R5 */
>> +#define MIPS_ISA_LEVEL_VIRT "mips64r5"
>> +#else
>> +#define MIPS_ISA_LEVEL_VIRT MIPS_ISA_LEVEL
>> +#endif
>=20
> Do we have a bug on file for LLVM for this?  If not, please file one.
> Either way, please include a link in the commit message (and maybe in
> a comment in the sources as well).

This is a perfect example, strictly speaking VZ extension is a addition =
of MIPS Release 5,
LLVM is doing nothing wrong.
In reality we are happy to run MIPS Release 2 Kernel on Release 5 CPUs, =
so GAS decided
to allow it live with any MIPS level.

Perhaps I should reword the comment.

Thanks.
- Jiaxun=
