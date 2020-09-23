Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16072751F8
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 08:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgIWG4E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 02:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgIWG4E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 02:56:04 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05DAC061755;
        Tue, 22 Sep 2020 23:56:03 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id k2so14673787ybp.7;
        Tue, 22 Sep 2020 23:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A1rC8148NbtE7cAa6JwGIJx/jujejruTMtLlxy4dSdc=;
        b=sMKRsVFFfyj/ktHuInnipw3t4xnoKKefK9Dc20KJhpa7HKSB1enncV/C+TmSfBR4gq
         dXIqoD8y17hMCaQe8YQ/WlFlcrf/INOmr070uTqrRGU5TwI9PeKOA8xTAK5wQ+AeN84y
         tLU5t+Hx1vFn5iIGy8Zlx2ItM6hnPAMuiRnW0TjzaBVSMIJlcoPS6CHs3KfyqDaMzBvg
         5Y56U/2pP1pGufflSF/Ho6kFWk5v5GNnzVCDHPxtFgJ2TTZtJoiZpzLCVO0blgak5gFT
         lnEoZw4ddK7FN/umMEcL34+Dw9rzMorb7/illyuuvuGxV37rbDZbNqYKOdS6HRpx04+f
         xv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A1rC8148NbtE7cAa6JwGIJx/jujejruTMtLlxy4dSdc=;
        b=k7NwSb20x74/JRB1wmEuSlwzuG77PbzX3NQmDYQeYyEyr/018PKu3YZFUTbnwlQxRg
         rfM7gP+N+O9TXpbDBWewR2VuwLHsO80MEtlzF7UGgRP3AAsSmID9HT905erkybg0GS4N
         +afBCroZb2wqFrsUCNiHeJMAxK8VfWuULahNDF579XtzssKJV5sjSICsZAK4rhEQMaFx
         HAgyfAjnVO83uC1xN2kZ2XjAQF/8+dgdHBXvx9R4Ouxnc59RhwJ9hrfw4ZK3pq7QE6/v
         2nc/6lv8nfW32HUFu3/8xD7Nkvv6+2e5ubKBuHj/mJCkROTEHibY1Hl7zxl3r/P3+TuJ
         VCAg==
X-Gm-Message-State: AOAM531L/plObpBCfiYqZdNYUCBkmJEGz+WvprkhJ33J2ybUqEFtBhE6
        msFMo93ilRWTugAkEQWJJkDU7mRYQqVRCXTA8/ZVjHvCAek=
X-Google-Smtp-Source: ABdhPJz3/hDbaCBIzBn/O4OjEfK7uaKkf06n5MTt5m3W8qX/62oxWN/RFIPh0hzjk8zIvbONy3ns+C0kI7unDxK/jVM=
X-Received: by 2002:a25:2bc2:: with SMTP id r185mr13084615ybr.71.1600844163159;
 Tue, 22 Sep 2020 23:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200923065326.44898-1-liwei391@huawei.com>
In-Reply-To: <20200923065326.44898-1-liwei391@huawei.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date:   Wed, 23 Sep 2020 08:55:51 +0200
Message-ID: <CACna6rwOxyUjsE8yyvZ1y2KvL+1YQf5QP-ioi2oi+G+ZPOSSBw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: BCM47XX: Remove the needless check with the 1074K
To:     Wei Li <liwei391@huawei.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>,
        "Steven J. Hill" <Steven.Hill@imgtec.com>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        guohanjun@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 23 Sep 2020 at 08:54, Wei Li <liwei391@huawei.com> wrote:
> As there is no known soc powered by mips 1074K in bcm47xx series,
> the check with 1074K is needless. So just remove it.
>
> Link: https://wireless.wiki.kernel.org/en/users/Drivers/b43/soc
> Fixes: 442e14a2c55e ("MIPS: Add 1074K CPU support explicitly.")
> Signed-off-by: Wei Li <liwei391@huawei.com>

Acked-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
