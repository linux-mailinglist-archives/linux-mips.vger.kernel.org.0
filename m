Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5E032BD96
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345619AbhCCQRI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:17:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1841789AbhCCGhz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 01:37:55 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE46C061756
        for <linux-mips@vger.kernel.org>; Tue,  2 Mar 2021 22:37:15 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id dj14so3616592qvb.1
        for <linux-mips@vger.kernel.org>; Tue, 02 Mar 2021 22:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=JjUdrjSLFwwkPO2DClC/3ru6MIfKJMQn3mwQy3ShDfM=;
        b=aa3UGmWRyiyDxBQ9ooJTUmC99nDe+8Hwfr+NOUWc0p3QwMGWCAmMu9igovWBIWgIqO
         T4KIVAMCsmCRaJRVgtlUP7HQ4XJpKWEZ/X0g2V6BwYKXPgK42TYaZ66aW+iiXI2JDTbz
         7Mst0LHf/n0k5wBnko2idMC0KUTLejqkv2BnUTkUYuEWi6blA4jLwXv2Lae+Rwhu9UrB
         zpXS+/GNntEZlHK0GVa/KC+zo6q9c1ckIiChXi+Kpt4OybwoyL1HMgCpyIfjCVboTcJd
         o7xnASbyt2KCezjTQhNdJRFBLjyqDLsNZSt6c/To6OAuhg/m5JEDAepC5YrkER0+Gyde
         E31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JjUdrjSLFwwkPO2DClC/3ru6MIfKJMQn3mwQy3ShDfM=;
        b=lzzLtK/jcyM5sIKRtLMQ224Ym4RY6o/VJoEHxCBhcXopUIkRjpyWM0EM9Rm8KI0xxe
         7BaqDtCwOAOsg+K51vW2a4DOJnK4tXa5Pca42BXCnT62jDu18U80QrWunye9xoiMDG67
         +RTRDdr1OdRdNRkj4nw8QjkRb0xMuAmOaU2nc4fT9ZvwizDqmUe86iQ8c7KzcIJsDeE5
         sY9YTHBe+MgEFMVmHmX8T1O5triloJEyXeERxV9UcR/qZi3SDd3ItOPEEPq6AC8uZr38
         QOBPeGLdB5pFs3FapqQZUgz4i7qlai/3ay1s/DX/HTolCRMhxnVtNaBQ07ZWO0/OHeFU
         9Ydw==
X-Gm-Message-State: AOAM5316PHXGufkefYajLeOrVqRKBb3XVl9iCn3Yg2/9gdbVP7KQyYhY
        QoHL4Igq7s8eKIQFF4yi366RdrZm6sImJn0PTMCQyuKgjzI9QA==
X-Google-Smtp-Source: ABdhPJyjekH/eEH56MfI4To2uCrLCGF7huej18lfPTkS/Gdchhv6HMUVl7U+mrE++ueuixTWoMfpufA1+HxTsx2n9So=
X-Received: by 2002:a05:6214:d84:: with SMTP id e4mr23083199qve.26.1614753433844;
 Tue, 02 Mar 2021 22:37:13 -0800 (PST)
MIME-Version: 1.0
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Wed, 3 Mar 2021 14:37:03 +0800
Message-ID: <CAKcpw6WDfdDDX_zsETX1VYnZtxA1uu3NOgdYsfWBxGq-Wvpy3A@mail.gmail.com>
Subject: QUESTION: why mail always delayed with 1 day?
To:     linux-mips <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Recently, I send some patches to linux-mips, while it always cost almost one day
before they appears on

https://patchwork.kernel.org/project/linux-mips/list/
https://lore.kernel.org/linux-mips/

I guess it is due to something wrong with my mail account and or client.
Any idea about it?

-- 
YunQiang Su
