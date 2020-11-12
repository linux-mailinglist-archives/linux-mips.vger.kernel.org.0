Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8604A2AFE10
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 06:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgKLFdU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 00:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgKLFSj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Nov 2020 00:18:39 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4144C0613D1;
        Wed, 11 Nov 2020 21:18:38 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id k3so4431490otp.12;
        Wed, 11 Nov 2020 21:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WfgY4NBj+0PmzbiLq+b9+ULskd59tjpCJgRhyG5J0k8=;
        b=hqYpjrD8LkGtcU9kRUoSDHu9D+nk/BoGIjKN/O4ZTOEsso58G3xzPVJwEtiqnqq/iz
         EutCOAWnRjPC4M3P4mKu1vAmlysKAJJ39gT67ujEtIEFZnYudURzfEEaFFvoby5PYDeg
         WGwgQ8oX+IFYpLnbesqy5Ia9/WJUAk2Xl9Dxv6an9vZyDdVb2y8os93JKHiy1AKEouPz
         ZdURh7ongmDTj7ui0P6A3RoB/Z+s3HqGImY6wP6yiACbPwssgtDy4+QGSZtRfSncp5oP
         HYpY+qBgimQSDzpzvqB38FTtLcdq0cTY6PTDehza5Drh4GFO/c99hgr7Pt7uK18kFWxs
         EXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WfgY4NBj+0PmzbiLq+b9+ULskd59tjpCJgRhyG5J0k8=;
        b=sT18voX3wZ+FBKp905p33mJTTeei1M2VDM2g6vKTo1jhjgnk5dcx2VNNfI1man+6uw
         reDcLhLLj5x1u1K8ZMakVr8aYw9ZWLCpsGO56GLojur3dHCfbfR/L8eEmWtilzDhq3G9
         vFQO2Ts4R+xJcaxcKpwnHtsriSzPZ9jDVG2vikWqHK3NmirFFX3L7NYcaX4Tb3SkdM2i
         ijpju1FxmWTjHxGjz1iV8HBoyC/Xz/6+0PqmwqE7O+j2ZhMXTeEkYHFq0A4Smy8apl0L
         hYRSsCUFpvJxW/jFy2njT0a9LHHtKzJUds/lFITi79BNMzGC/vngo2M0jlZjWgda892O
         Md3g==
X-Gm-Message-State: AOAM533/gt990nI+7woIygyNDF1y/DDdZ7jbh3WwNgckDX/T5l0WMy6/
        Z8deS9iAdZfB3cHt32BAoVKEc+ldREYtQ45t27Q=
X-Google-Smtp-Source: ABdhPJyTTQiPTf7wS9BZ6pXrL5d1+bU06pCVQUQ/opNV4D1HnkXpInj1YDPkUdArvXy14TA/5jvWZEbAY8aB1+dFm1Y=
X-Received: by 2002:a05:6830:18c9:: with SMTP id v9mr21231685ote.74.1605158318274;
 Wed, 11 Nov 2020 21:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com> <CAJsYDVJtPqd-aPjJZFC76R2fbv1i=tVzRR7S1VFAMzp1QcPbiQ@mail.gmail.com>
In-Reply-To: <CAJsYDVJtPqd-aPjJZFC76R2fbv1i=tVzRR7S1VFAMzp1QcPbiQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 12 Nov 2020 06:18:27 +0100
Message-ID: <CAMhs-H8ZXQ_2uJV4GC5J+sv4wmZUY8iGm-c5d-3X9t8e1PnfaQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] MIPS: ralink: add CPU clock detection and clock gate
 driver for MT7621
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, jiaxun.yang@flygoat.com,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Chuanhong,

On Thu, Nov 12, 2020 at 2:26 AM Chuanhong Guo <gch981213@gmail.com> wrote:
[snip]
>
> I've already said in previous threads that clock assignment in
> current linux kernel is not trustworthy.
> I've got the clock plan for mt7621 now. (Can't share it, sorry.)
> Most of your clock assumptions above are incorrect.

Well, that was of course expected, without a real clock plan this
driver was only taking into account Oleksij Rempel suggestions to try
to make a driver good enough to properly be maintained :).

> I've made a clock driver with gate support a few months ago.[0]
> but I don't have much time to really finish it.
> Maybe you could rework your clock gate driver based on it.
>
> [0] https://github.com/981213/linux/commit/2eca1f045e4c3db18c941135464c0d7422ad8133

Thanks for the link, I see there are three more clocks there with
frequencies of 125, 250 and 270 Mhz. all of them having main xtal as
parent. Ok, I will take this real information into account and will
send v2 after a bit of more feedback comes.

> --
> Regards,
> Chuanhong Guo

Best regards,
     Sergio Paracuellos
