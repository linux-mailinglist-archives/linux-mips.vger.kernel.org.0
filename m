Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB4E377C79
	for <lists+linux-mips@lfdr.de>; Mon, 10 May 2021 08:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhEJGpI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 May 2021 02:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhEJGpI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 May 2021 02:45:08 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8160FC061573
        for <linux-mips@vger.kernel.org>; Sun,  9 May 2021 23:44:03 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id b25so9662310oic.0
        for <linux-mips@vger.kernel.org>; Sun, 09 May 2021 23:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=p4QVkoSceAD0cNWEBhxG7I+e5PtbXU/V6ZHwSLEEg1A=;
        b=lZTydeU3Odd/M0wXuPJxS/YMhYeN5mCiEpBi8Vnn85eGvurhAW2fvB13yKPa8gFJRF
         0LQDpzGxrf5XOsCmOWK3bmGRLCP60ZgyBB1U9XyHo2j7vDwRDXuu6S1CuHZjYi1yw1uX
         mWlT2pncAbnEhESFceelHU/uF9tVUmeC9gyk7zK1y4D9Y3ZhLVJgF2XQQ67Ccrulb0US
         KgyO0iHt9Bi9zhg6YkfV343/g7WYy27P13SRhuNMPr8ItoegAlT9mUUSQgZubtVb6bwB
         3zZJjAMM//hDuVr/G6QMv9xTxPUhYm33hKQlmoD0S562zhfRFeM4eZdfNN56EUTQ2XVw
         Yz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=p4QVkoSceAD0cNWEBhxG7I+e5PtbXU/V6ZHwSLEEg1A=;
        b=Fjm3wXs4eCl5+TMRKSYQsGSD0emShO89enlXrE/Omt6AWnU0f+e3Gc56hZehIbtcp1
         3St0ew3T1mwvHUYl9MjNC/ImMGvOYT3Giv/Mp9GMfJlsw5XePlmgSqup2Mi1wsmey9vS
         9SUlB8fsAogd51WnXANInqziQMru/Dq/Gq/66FelB5yLCZJKJU3gNAjX93LZ78qnErBe
         QS+HtchC98FxlQ944p0RlP+h2xZ1xvcfmxAyPAl65EcbkiawGKFQIZaNgzDVT6WmJJhk
         qg/2u2eGJ8OrS1dX52CMU7LGc9Aqfy7peLlBTTqSGw/jQwVIT94nEyJC5QIjxme7lM1t
         mLUw==
X-Gm-Message-State: AOAM532NnbIQEZhasVT8Fcf/Bp/6G+ODwyOhegO5xu3b6C2tsXVkn8qQ
        9o87VetvnfwWFIOE5DBd6NLap1QvuqlzCBWLJ/vEv3RskI5zqQ==
X-Google-Smtp-Source: ABdhPJyVdzqsP+rLX3WJ06Fa548PdjAPpu5WsmTRzTVyrvsS1mL0XEd0wQQfYD9tsk1p+FGwkPBSHAcU2C79xQXsKWw=
X-Received: by 2002:aca:b5c4:: with SMTP id e187mr17106264oif.149.1620629042789;
 Sun, 09 May 2021 23:44:02 -0700 (PDT)
MIME-Version: 1.0
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 10 May 2021 08:43:51 +0200
Message-ID: <CAMhs-H-1f72=7C3j1jCmdLU8+5LurPO6nRVcvPJO_rxPitQBnA@mail.gmail.com>
Subject: Some doubts about mt7621-pci mainline place
To:     "open list:MIPS" <linux-mips@vger.kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

I'd like to mainline for the next merge window the current mt7621-pci
driver which is in staging now. I am in the process of validating
current bindings to make first all the need changes in staging before.
This SoC is based on mips ralink platform. MediaTek MT7621 PCIe subsys
supports single Root complex (RC) with 3 Root Ports. Each Root Ports
supports a Gen1 1-lane Link. I have some concerns that I am not sure
how to achieve before getting this an attempt to put in its correct
place of the kernel. This driver has been cleaned during its long time
in staging and is properly using the pci generic APIs instead of the
PCI_LEGACY which seems that all other drivers in 'arch/mips/pci' are
using. The driver is generic enough but it needs mips iocu region
configuration that is done in the driver itself. So here it is where
my questions come. Is 'arch/mips/pci' the place to move this driver?
Is the driver the correct place to configure the iocu related with
pci?

There is also one issue from a while now that sometimes is reported by
the kernel test robot [0] that I'd like also to fix correctly. please
see the link and my comments there.

Thanks in advance for your comments and help.

Best regards,
    Sergio Paracuellos

[0]: https://www.spinics.net/lists/kernel/msg3617511.html
