Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FE8279FCF
	for <lists+linux-mips@lfdr.de>; Sun, 27 Sep 2020 11:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgI0JFe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Sep 2020 05:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgI0JFe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 27 Sep 2020 05:05:34 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB63C0613CE
        for <linux-mips@vger.kernel.org>; Sun, 27 Sep 2020 02:05:33 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id z25so7960688iol.10
        for <linux-mips@vger.kernel.org>; Sun, 27 Sep 2020 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Kwf4QB7ab18t/B1bPeTlkXOcDjmmKE2gorvlNLGzv8o=;
        b=qNH5DfMunJJJ7ZjQISQe3kt3ZCNEUOCaHmwp4rSydfYQA+RnXr39OIX0wFrFf4n2sI
         fdHI+IkWGe0eXYdRSwB8BJbX8AHHw2KY+WntWkAqC0ElGcgBjtqW9S6RfBwOBEDCXxh9
         Tzr9R84zyvROtz6EjSaODdaa68EWRxgUUDPSJs+e0HbGfo4WxWdRZm9LgeZoM/KIrEea
         zUXs4TKj3Tq+dqBq0FEIKpheL04KUAwlUCUEw4wBGqeZbDS3bg6GOekHHz8NlEPPXmtT
         6pQhGE5ED6LZS1MLJ32TZj1vYpGJYm912RVJHDNCkfNuhnyD3UP3stz62sGtehoHKNOw
         pWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Kwf4QB7ab18t/B1bPeTlkXOcDjmmKE2gorvlNLGzv8o=;
        b=Wf1Hk7/T4z1D9+GrC6ovHbA93DDwQqah15CyDS7kSILQUKQLSdAxySfFIPpma2hT+K
         +8ps4IEyc8jmhTVIkgb4bAiK3dvGbGa9tNjyckQCk2CSBU22iguy54kSifziffEU5PeH
         S54gR9KTj76ijjGXNalbwsuS+6me0ozYQWRUechevoeFjn1xQMXs0mHJgBJBzGeBKoK7
         dMCsSIeb0tjZKuRyFgr7xekGgW7Pt83FVVURNGg5Tn2sczyQ1f+WkTq2izoIW+bZMTdC
         +KwL9LwLR+winnuysJlRaxJkcSiADeEPQGGgt0/awZwLBfihloS+w/IRdCDlnbuipzMb
         sTDg==
X-Gm-Message-State: AOAM532MCg92bL7R5f3kV2UlrmoPIbruu7TzOxedoQiVm6KArl1T8qpA
        rilIsiQrkzK1UxQRc1yO4HTHW+T+21rBSI3y6tLQegYRiyNGq7A8
X-Google-Smtp-Source: ABdhPJw9qMe0XdIZbEQTtiCa8BUkeCueGHqKn37zlOf1nSWOw0vI5F/YdMNUg9NbqoHbM3QkkrKrHF+Ir4dHceV48aI=
X-Received: by 2002:a5e:d716:: with SMTP id v22mr3930393iom.121.1601197533240;
 Sun, 27 Sep 2020 02:05:33 -0700 (PDT)
MIME-Version: 1.0
From:   haojun wang <jiangliuer01@gmail.com>
Date:   Sun, 27 Sep 2020 17:05:22 +0800
Message-ID: <CAPhSAwuNuNdpg37D55AzwLL_8jjQkEEGv5ZDX=TXMv3EQ-TUiw@mail.gmail.com>
Subject: 
To:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

subscribe linux-mips
