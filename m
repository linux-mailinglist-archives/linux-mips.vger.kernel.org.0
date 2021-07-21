Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19A33D0895
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 08:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhGUFX0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Jul 2021 01:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233349AbhGUFXO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 21 Jul 2021 01:23:14 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE8BC061762
        for <linux-mips@vger.kernel.org>; Tue, 20 Jul 2021 23:03:50 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l7so825220wrv.7
        for <linux-mips@vger.kernel.org>; Tue, 20 Jul 2021 23:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LLVD1J3nQD5jfzD/Z0julSyofDbeE2fYH4Xvj/4eakQ=;
        b=vyRxqbcprpkVe/zNi18wjFtSfadWd2IhcpGSt8Pry8kZeFoXvqMDY7NtBhn4Hu0K+h
         rMrImEBrPq4Wk2ortPVJQOq3HrijBdR4qLQmf4cFVL3hOXjf+fKU0YQaPhrN+AxscHCy
         YzA4Ux446F1CTycLLWoAAYBvnw64+hX0M5ZAQTWnF/FE2VP76hKHrbeYOXntaMzrLDR+
         5Xt2O19zvJGJu2/Sv+jUeqowUGjMO9Oi5iWzw+HsoN6fYDusPxP4K58thtO69/NBRNpN
         FbQgET3IKwgwEhLLyl+QjCLXGm2B/sBZgWz6CSqlB94yytn2lyJhr/c2GyVYnfDv3z/X
         lZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LLVD1J3nQD5jfzD/Z0julSyofDbeE2fYH4Xvj/4eakQ=;
        b=Pvidq0iN8V9Kr8S7d1vmUGJuRDmMGCDE1hXrlf0WZt3n0RIjXl2h18Bri9azeFROmd
         DdvY40J/BaRI1C86U1vKaxtRoy5VViCKxc6TqtZoSuoFYney44m6oMPaNKNDWKpGQyIq
         v3aLqYkmvgXQ8s3IOP1C0g3qnEoEznICPYP7DpJgYF4Lt452wGE2HLvTBplf8yKDvbPp
         xBBXZ5hzeMIKI7ZG3OhMEfGAO60ysbeeZJ7sWxPAG0eCRMloiNr32tVOQToF/2tLp4s8
         A99w7kD0ErztZfojovf2DdA2voD4a0Bvo5K9gYrmeaxV5bW2f67YvFBneTbYllf2HTHu
         /OpA==
X-Gm-Message-State: AOAM531T8XtYptdZBEiixbhv3mEF61g/3NtEErkpjnc+E7LK/a7MyLrU
        ilAM9vZhtRXHtxdul3RsgmkpL9m0C7izhzB3ZxEFMg==
X-Google-Smtp-Source: ABdhPJyddlJAaOzZ/gq+V3H6ZGOhy/2kQ3ucAtz5059UxRJQgffyl72+EWTWfg0vA/o2JgBiaRyG9fmW7mxFx8gEr74=
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr39394187wrn.226.1626847428914;
 Tue, 20 Jul 2021 23:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210614223317.999867-1-tyhicks@linux.microsoft.com>
 <CAHUa44ErgoxT3L1W-ouoQwUg1fNC-zagOOgy=KBuGN_pETnYaw@mail.gmail.com>
 <20210615133734.GY4910@sequoia> <944c1df8-3e9f-0026-c83c-d778f42fa1b3@gmail.com>
In-Reply-To: <944c1df8-3e9f-0026-c83c-d778f42fa1b3@gmail.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Wed, 21 Jul 2021 08:03:38 +0200
Message-ID: <CAHUa44Ej85bbn8CzsJ24CWkeZQPMWC-w_m2ypP6nPjcEuErFBA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] tee: Improve support for kexec and kdump
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Tyler Hicks <tyhicks@linux.microsoft.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        linux-mips@vger.kernel.org, Vikas Gupta <vikas.gupta@broadcom.com>,
        Allen Pais <apais@linux.microsoft.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Thirupathaiah Annapureddy <thiruan@microsoft.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Tyler,

With Florian's Ack on "PATCH v5 8/8] firmware: tee_bnxt: Release TEE
shm, session, and context during kexec" I think we have everything we
need for a pull request. I've pushed the patches to
https://git.linaro.org/people/jens.wiklander/linux-tee.git/log/?h=3Dtyhicks=
_kexec_v5

Would you mind testing that branch to make sure it still works as
intended? I'd appreciate if you could double check the tags too. I'll
send a pull request for v5.14 later this week if everything is OK.

Thanks,
Jens

On Tue, Jun 15, 2021 at 4:16 PM Florian Fainelli <f.fainelli@gmail.com> wro=
te:
>
>
>
> On 6/15/2021 6:37 AM, Tyler Hicks wrote:
> > On 2021-06-15 09:23:25, Jens Wiklander wrote:
> >> It looks like we're almost done now. Thanks for your patience to see
> >> this through.
> >>
> >> I suppose it makes most sense to take this via my tree, but before I
> >> can do that I'll need acks from the maintainers of
> >> drivers/char/tpm/tpm_ftpm_tee.c ("tpm_ftpm_tee: Free and unregister
> >> TEE shared memory during kexec") and
> >> drivers/firmware/broadcom/tee_bnxt_fw.c ("firmware: tee_bnxt: Release
> >> TEE shm, session, and context during kexec").
> >
> > @Rafa=C5=82 Mi=C5=82ecki, we just need an ack from you for the tee_bnxt=
_fw.c
> > change:
> >
> >  https://lore.kernel.org/lkml/20210614223317.999867-9-tyhicks@linux.mic=
rosoft.com/
>
> Rafal is listed as the maintainer of drivers/firmware/broadcom/ but he
> did not author that file, Vikas did, adding him.
> --
> Florian
