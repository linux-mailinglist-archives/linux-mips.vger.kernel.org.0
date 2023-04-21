Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 041C66EB361
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 23:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbjDUVKa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 17:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbjDUVK3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 17:10:29 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F821B8
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 14:10:28 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id F1AB85C0158;
        Fri, 21 Apr 2023 17:10:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 21 Apr 2023 17:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1682111425; x=1682197825; bh=CFdOttiEqXH2bOWdoFEVP1yGyLXMpQH9gUo
        Fldrb98I=; b=y9Tt/tHhZ0x1PCEcKkCKGstpbQzufRC0LxdPY47QM7gaHiWY1wp
        EhCimD+GCdNEgEAsK3HABHf5D/El5I3otOgjQxP0Qshu3zSOaRqoAaXprc5a3NnY
        bUuwqM37XnIN1Ej9KE02ZsZPAHzReadP6n14XnuVmiE3ZSA8cOa8CZVNDK9zvKk9
        yeszjuz94ruzuSvdcChiOlV6DZJeY2zxwq7Yvm4h2NG52RjVUXEIQEJ8gYUt79Jq
        sqE8cwHAonZVBVkmCvzlNGSKPTSWqcVjOSuTH/TPBU6QJjOr+0/BiP/ccXx8i5Ie
        3Ek4rG6HPKthrv3gS9xVr3XT+kd1R4Qph0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682111425; x=1682197825; bh=CFdOttiEqXH2bOWdoFEVP1yGyLXMpQH9gUo
        Fldrb98I=; b=kwYUtTeTfkF3z0nN52X7V3NJ+aalKC1BYCMIIGVxbc6lgZ4ZW0p
        lz2CGSeEsJV6P/LBlJa1CYGuLRtpnOQPqYbP1/TAwmRD/q/UclOhYOjj8j1K1GLu
        q8sE1bBFOShJ3pFBka8b2TfR8NhK9bqr49rdNJc3WVPSz7ZLk1ebyxsv8lMShPdf
        ubKx8oYIpEUOHRdd9xgwtHmbNnhSpytkcdFE2EnU92G8Vo31nQ4KcSIOYMzXVbpf
        /RcqSaeeVxph5SbJaCSqRC2oPsUnXcD5TReTcA72mdUf70dNEjhXrCn93TOsbcQ5
        lv/XYrJ+T2hVqlyCh4lFyXLyWhRsyGxntNA==
X-ME-Sender: <xms:wftCZGMaJ3rCeKxvCwxtKGpa1Zy81KrPXW8QMSibQsU_WhAehVVqSw>
    <xme:wftCZE9KlZmoSgoVQMIYEnRXZyIAVZXr8Jts_h-cNAgQTAE0a_dog9iR9KWq_nYyT
    luIpE0C0GflLd85ec4>
X-ME-Received: <xmr:wftCZNT1h3_wG2yBZcBEVXeY0baxPNTogB4Aqcrtk4ONrTZUEHBVUPwIIDOV1VC7XiZn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeffffetjeejjeehheffgfejteegfffhgeeuleevleefudei
    udfftdefkeefleekudenucffohhmrghinhepkhgvrhhnvghltghirdhorhhgpdhlughsrd
    hssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehj
    ihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:wftCZGuPEzCb2hUtybrWG82q04nTjVh7WHkvjAtHtVithNd6ZV1Psw>
    <xmx:wftCZOf2FUjpNsiHzIebyNb3XvRGX7TQYjp4NbqoohumVbcxA_v1RA>
    <xmx:wftCZK1GCN0DeyEKkHKvYuT1IhW_8-ch1JQUmSrgLUC9dTLl2S0nrw>
    <xmx:wftCZCH9ZqPk73eztyI0MTD4_FJb17UkPQe7wTMKqsThp9xibWoNFA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Apr 2023 17:10:24 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH for 6.3] MIPS: Define RUNTIME_DISCARD_EXIT in LD script
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230408203348.28896-1-jiaxun.yang@flygoat.com>
Date:   Fri, 21 Apr 2023 22:10:13 +0100
Cc:     "kernelci.org bot" <bot@kernelci.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <66AD1B21-9943-4228-BE9E-7DF14142BDFC@flygoat.com>
References: <20230408203348.28896-1-jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=888=E6=97=A5 21:33=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> MIPS's exit sections are discarded at runtime as well.
>=20
> Fixes link error:
> `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
> defined in discarded section `.exit.text' of fs/fuse/inode.o
>=20
> Fixes: 99cb0d917ffa ("arch: fix broken BuildID for arm64 and riscv")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Hi Thomas,

Also ping on this patch which is blocking KernelCI=E2=80=99s build for a =
while [1].
You can check build logs here [2].

Really don=E2=80=99t want to leave this as a 6.3 build regression.

Thanks
Jiaxun

[1]: https://linux.kernelci.org/build/id/6442f2ccfbc366d1592e8739/
[2]: =
https://storage.kernelci.org/mainline/master/v6.3-rc7-180-gc337b23f32c87/m=
ips/32r2el_defconfig+debug/gcc-10/logs/kernel.log

> ---
> arch/mips/kernel/vmlinux.lds.S | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/mips/kernel/vmlinux.lds.S =
b/arch/mips/kernel/vmlinux.lds.S
> index 52cbde60edf5..9ff55cb80a64 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -15,6 +15,8 @@
> #define EMITS_PT_NOTE
> #endif
>=20
> +#define RUNTIME_DISCARD_EXIT
> +
> #include <asm-generic/vmlinux.lds.h>
>=20
> #undef mips
> --=20
> 2.39.2 (Apple Git-143)
>=20

