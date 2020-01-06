Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9D1131BC8
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jan 2020 23:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgAFWrO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Jan 2020 17:47:14 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42462 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbgAFWrO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Jan 2020 17:47:14 -0500
Received: by mail-lj1-f194.google.com with SMTP id y4so38279652ljj.9
        for <linux-mips@vger.kernel.org>; Mon, 06 Jan 2020 14:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iINXiMFidNPmE7c3AtxT3THDZ1hEuF3OMM13Pg6sk6w=;
        b=g0z+DSnklv6iu5J3Afvb/fXFAHDuKf7PzDA3LoC2ygbFu0coxpdCIpffPdp82RveZi
         cxryO/aUuIb0EuNFY1w/n7kDCOM7UzXHAV0vuSths54Yk3/4ciJbNe0FhvUUW2KJSGzu
         AMY4hSpKCEmEOOMceh+ndpGA/p1Jl+K7DK8G8Y2RWW3VXr77AbKNU+2h1w6vO9VxpY/6
         IEfb2xnPwuQqLNBwdriTJsu5OLJ4oxpyLDAtNH83LXZopMOmpJRnqlwKBW+rHFlbMncF
         UI3c4G4AVCT8yI4HVpksGA9rdtH0CrgOQBk+zoJEPb24vN3aVTasxKrKGAWkQjxKMCPv
         CKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iINXiMFidNPmE7c3AtxT3THDZ1hEuF3OMM13Pg6sk6w=;
        b=ZY064gSXsZ8phus0gb4QDIQdoJiuvQD6RX46/ENGvMudRziphJYep4UGdcxb+jPvaV
         zyfb1/w/dhlq6hv8QK7h2S3QiVckl+Vmrj2rqBUP4KZEHNx/ta/+PARMSG0c5IuCVCF7
         JsZbgO9lJXjKA6nPG2FsGvfqwhi39UOuIp98t7C/vEilzW9odRGyNKEIlgCnywU1hzM4
         jbMc41vhDA3Qufhy1W76gbegXwnXCvOBKXTfwu4ilLZqxL78mlPQnuEXq19gtfYTU3S6
         HK4bw1fFwpQG79PJTa1JCq3JrAnQZnTShKp7eUFQaaZfZBh0YozKgyFM3hu55DS/urgS
         KzwA==
X-Gm-Message-State: APjAAAW9SabtNOFD6Se5b2Pqthb2tBlmW5lza39tPZ3BSvGO9QzVKygI
        qlexTadDqVpBKly6xZlBCyfyETD/F9ypLtAwAqMm9A==
X-Google-Smtp-Source: APXvYqyb4+z1PnlvO0PT0IM3lRyC4AM5S5O/rRzCFuE2xIcizWcFowXRhyD9waT90956XcAyA0plvbvrQ5LOJyWoZwA=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr50441415ljj.77.1578350830450;
 Mon, 06 Jan 2020 14:47:10 -0800 (PST)
MIME-Version: 1.0
References: <1576426864-35348-1-git-send-email-zhouyanjie@wanyeetech.com> <1576426864-35348-2-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1576426864-35348-2-git-send-email-zhouyanjie@wanyeetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Jan 2020 23:46:59 +0100
Message-ID: <CACRpkdbfZjqd_ChPhX52wwu56TwXQJhHyUvRVRKw6WUD33utCw@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] Fix bugs in X1000/X1500 and add X1830 pinctrl
 driver v8
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Rutland <mark.rutland@arm.com>, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Dec 15, 2019 at 5:21 PM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:

> v7->v8:
> Separate the part of introduce reg_offset in [4/4] in v7 into [3/5] in v8=
.

Patches applied. Sorry it took so long.

Yours,
Linus Walleij
