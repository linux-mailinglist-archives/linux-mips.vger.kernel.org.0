Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 124014D14DF
	for <lists+linux-mips@lfdr.de>; Tue,  8 Mar 2022 11:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345877AbiCHKfA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Mar 2022 05:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245490AbiCHKe4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Mar 2022 05:34:56 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E646042ED1
        for <linux-mips@vger.kernel.org>; Tue,  8 Mar 2022 02:33:54 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id u124so13006493vsb.10
        for <linux-mips@vger.kernel.org>; Tue, 08 Mar 2022 02:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=WL70BUnQ9ECkrFgLiclEdyC+LhxGlMoS4GrJX3TGgu8=;
        b=f5ZzkgQGuQYwGYig1UDUBch4002jrP6nb3fsjZe3aQ+VEopxLsoqP5KftHO0Y+xDkq
         VkrRf1mlyKveWbUoh9xlqWTRGP6BbRVgi6WbI6WYHpEG46u72r8EARCgey3SY9IAA3Zw
         hCqSEphK4A/+XYzXD5PnEsqFCCnE81EV8J6JfoLDaHDM0PuVNvauoU42RrRiilgCFSUL
         Oc3qKA0F1zQmBJ5lHkQKH+Nf1V+X50eQ3OoxO+Vae84n0wf4c76zbuqrV5wvedMQP/Sk
         TIAy5SjKewUFxHw3ZIU1Z2BexkSiGaCpphg0AfvNo7EtbvjcGb1VuLn3pF8rtwTnKx6w
         lWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=WL70BUnQ9ECkrFgLiclEdyC+LhxGlMoS4GrJX3TGgu8=;
        b=N0IvfpYFdw+ChQ6FEYGq/4/Azdpd6sUt/2RjxIq/XveqIxCjb7QMM89FC9q7jPwIoL
         KjcmmY76ZWPXfJBQSHLsX2QjL6LKn1GgOHe1JJx9WCUtU85yeBHsDyUeoC/21yGpAGTM
         SHMbD8Ds7vCcjpiTJzvktLQpkJMRXK/DWrp7k//Dzz6MU5UkG5BWltzi4r9cobWtxO4m
         nHfnNqd1K5eMeveHXOdq1c20IzMunl/8BlYMQDJQePLhjCZlmjUgJIW26S3Y6I7E0ju/
         4Z3ovoD2szi6TxVIxIqIw1GsEVp9p8bWv1bKPrxLnDjV/nMI2AWgPdf8Rx5JGHVCdEzC
         9o7A==
X-Gm-Message-State: AOAM531wREjTe0u/eyZxRZhDmR0EbFGvUoLwBwbyBTMKr7z3tTgYLYws
        y/kE0bEobP4+V8QPpJXty4blJMXZTxtnrIQLtiU=
X-Google-Smtp-Source: ABdhPJwVKUT5FD0NlfGAOIrgoCf0NSBlzUuYuv6IdHEvazmK0t1UocuH1ku4BsYY69mc23bueKGlbKkDe5961TLuA8A=
X-Received: by 2002:a67:fe50:0:b0:31c:1eab:a9ad with SMTP id
 m16-20020a67fe50000000b0031c1eaba9admr5882269vsr.18.1646735633867; Tue, 08
 Mar 2022 02:33:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d502:0:b0:29a:8219:59d6 with HTTP; Tue, 8 Mar 2022
 02:33:53 -0800 (PST)
Reply-To: nislvraj@gmail.com
From:   Anitha Selvaraj <marjohn595@gmail.com>
Date:   Tue, 8 Mar 2022 10:33:53 +0000
Message-ID: <CAC5Z0DnWZ8P6_kjSTGmN2Gv2Y7tbEAAJU7_wwQsNb+V2fN2XzA@mail.gmail.com>
Subject: =?UTF-8?Q?Querid=C3=ADsimo_en_Cristo=2C?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e36 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [marjohn595[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [marjohn595[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--=20
Querid=C3=ADsimo en Cristo,

Soy la Sra. Anitha Selvaraj, me cas=C3=A9 con el Sr. Francis Selvaraj, dura=
nte
19 a=C3=B1os sin hijos y mi esposo muri=C3=B3 en 2007. Me comunico con uste=
d para que
sepa mi deseo de donar la suma de (6.500.000 d=C3=B3lares) que hered=C3=A9.=
 de mi
difunto esposo a la caridad, actualmente el fondo todav=C3=ADa est=C3=A1 en=
 el banco.
Recientemente, mi m=C3=A9dico me dijo que tengo una enfermedad grave que es=
 un
problema de c=C3=A1ncer y que no durar=C3=A9 los pr=C3=B3ximos 2 meses.

Quiero una persona que use este fondo para orfanatos, escuelas, iglesias,
viudas, propagando la palabra de Dios en su pa=C3=ADs.
Responda para obtener m=C3=A1s informaci=C3=B3n y tambi=C3=A9n env=C3=ADeme=
 la siguiente
informaci=C3=B3n, seg=C3=BAn se indica a continuaci=C3=B3n.

Tu nombre completo ..........
Habla a ...........
Foto ...............
Bendito seas
tu hermana en cristo
Se=C3=B1ora. Anitha Selvaraj
