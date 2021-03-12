Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8830F338DA4
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 13:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhCLMvP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 07:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbhCLMuv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Mar 2021 07:50:51 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A15C061574;
        Fri, 12 Mar 2021 04:50:50 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso11021793pjb.3;
        Fri, 12 Mar 2021 04:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pSbeanyn4dFl/9eIN82n307Zv+zzSyu6NOWLZPn9dUE=;
        b=n43d5Y0OCI0xWLt2lVL+y9CTBOkKBlihhUkOs31u95aQsXBNaSlfoxHZv3i19rh1+8
         AtFNCaDIITPsOrX8ngYMfnvHhpy5ZNQ5IjOSse/TUAn4rg6DXD914JeEgAPUBcUnBUtQ
         H3i+iicGFMcrRKygoubz0pbQfpf7DwoWi0dpkKEteFEMs66eyNsPsHsdhtyjGsoz9XJ1
         LxH7tjpK5cu+qMzCrN1e0FzaDa8cWbx/H9gy2FmopwOjMByAutdCEDc1hviNZ3wLeBPh
         FtZrlSWvc6jJpY+NTe9V58IxZKWBOfkSglpRWnFAUBjoQ29rA8kDZmQykCK/jc4M7K9h
         J6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pSbeanyn4dFl/9eIN82n307Zv+zzSyu6NOWLZPn9dUE=;
        b=rLiGGBIClFlSCplqdAUyU81YBFCX5CayZVvA5MnNfdtBRYdBkLV4DRP7QBWYGb76VB
         6fxeI/AM1klr8u6uSIFUCNk2ZHNNEchfY+DThejxtzlz8WRYgx3rKghGKwrL2cCgQUsL
         yC7svKxhFXVgaf9SUrJHq2XKAi2ONXxcEYeCCFjIc4HGuozJpfNuadO+1iRB0Ex6jAFa
         VhXvERBHSI6s4OHFAVSrjMm6ep+mPgVK+NvPwclZvhdr3iEJYUH87OsAB0tu15ZZIkaP
         14GUcQyd6PJxPDtdTImbG8Fi7nJhBpdmflm3JAfz/sxG1Bz0mqeggRkdueVMNMKb1ap6
         YsHw==
X-Gm-Message-State: AOAM531DV38erbsTganfTaCEr7IwU/4U3Js0AysCdMavmI3qPqnY2YQ+
        EehWu/cnEpHGghqLPjaRnFs6PTI8gEvWNqedkMBlHqdz6o014g==
X-Google-Smtp-Source: ABdhPJzEF/cM4WaoJJDHaw4PgutdGVqBig3iyorXR6hinT2Ph1i6yswMNcuQpuGeoS288HOm1SrSmKnHohUwh1s4UWM=
X-Received: by 2002:a17:902:c808:b029:e6:4204:f62f with SMTP id
 u8-20020a170902c808b02900e64204f62fmr13519761plx.0.1615553450462; Fri, 12 Mar
 2021 04:50:50 -0800 (PST)
MIME-Version: 1.0
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com> <1615476112-113101-7-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1615476112-113101-7-git-send-email-zhouyanjie@wanyeetech.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 12 Mar 2021 14:50:34 +0200
Message-ID: <CAHp75VfMS-sfuLEyGEkc_VLKDaOc8gD+eOSxACEpDxXdvdEH5g@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] pinctrl: Ingenic: Add support for new Ingenic SoCs.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>, paul@boddie.org.uk,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 11, 2021 at 5:23 PM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:
>
> Add support for probing the pinctrl-ingenic driver on the JZ4730 SoC,
> the JZ4750 SoC, the JZ4755 SoC, the JZ4775 SoC and the X2000 SoC from
> Ingenic.
>
> The driver of JZ4730 is derived from Paul Boddie. It is worth noting
> that the JZ4730 is special in having two control registers (upper/lower),
> so add code to handle the jz4730 specific register offsets and some
> register pairs have 2 bits for each GPIO pin.

> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>  # on Letux400/JZ4730
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>  # for JZ4730
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>  # for JZ4730
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

Shouldn't it have the Co-developed-by tag(s)?

--=20
With Best Regards,
Andy Shevchenko
