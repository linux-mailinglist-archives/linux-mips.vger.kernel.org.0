Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33EFC175601
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 09:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgCBIbu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 03:31:50 -0500
Received: from mail-qt1-f176.google.com ([209.85.160.176]:37533 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgCBIbu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 03:31:50 -0500
Received: by mail-qt1-f176.google.com with SMTP id j34so6938928qtk.4
        for <linux-mips@vger.kernel.org>; Mon, 02 Mar 2020 00:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FIcXgAhr8y4F88/rgp6+SHGXJBYJvz5O5G93Ip6x4vc=;
        b=DsEdc0u7PgbCRh/nmHYSTAFYSLxK33F3i1YrkkOGGKIXneYmJEfj0I3q/g5E0ljZJl
         NZxdzOADRje3OuBNWPuNlaPtlOrac8vEjCt3X2PoYkt/SWqTXylyyY7nFW2PTZKGgo97
         dLwaOl2MZkVZUGrR3fWoWv1vvViXD2BeyUSvOc/jYraFqAiEoocifsoy0KKE/IJzjZMj
         IXxIAJOtIS18/7ZdJPYirKS//VRQEReejS3kpwsyfSj5hFk4EvG5yN/RMGCuymLS4amZ
         WljE4gsJUGXvZ1k4cfunZSZ1riHL51fyfhUvTpD/pCmeWooufyU5PGuMS/DWfaYdqAN6
         WrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIcXgAhr8y4F88/rgp6+SHGXJBYJvz5O5G93Ip6x4vc=;
        b=uUYnR5zlmy+y2SKlbv4PtDfu/h0qyCEezOwpja79hHkC5ksyQOrpwiAsjK2B05We/n
         HRkCknKjhSGon7DVir2GnMPdXzk5UkEr7ppHGddU6SwIPJ6JUNYuRsNpB0n064HMmN12
         5b06o5rXS950LaLOxdAvIMSo3REKDZWcbct8tTDBP0BUSW4RhUH5+PgzfQcZuOZ5Qvsv
         Ubu9w0HqdAdbnHu4aOuTQuLqr+jTjL3KVKnbZSqYKa7K4GOQJsweAhUI5oqn7k29rq0E
         N6OQOyehgLheACNWddSz35mHG29UlVwiQIoZqCs7BLzuZv3+Jje5oAZJzMGzs3OAE7AR
         NVKg==
X-Gm-Message-State: ANhLgQ2DyTVPR9pmFqzEXsybRxjRT8SzK30yRAhdagKQWN0lwAOJPZGq
        KZKAXXLQvLrG9H+xxH3KWX5jbX6ngWhGn+v1VvAKQB+Q
X-Google-Smtp-Source: ADFU+vvyH+F2g+ECE6EsqMmPFz662ccbzFOMDlkQJAKHODmm+5Y102Pcz8zFOItMsEy0TDV3o8h8akxZxCEEh9O42i4=
X-Received: by 2002:aed:3b52:: with SMTP id q18mr5586375qte.130.1583137909631;
 Mon, 02 Mar 2020 00:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20200227144910.GA25011@alpha.franken.de>
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
From:   "dtb ." <carlojpisani@gmail.com>
Date:   Mon, 2 Mar 2020 09:35:09 +0100
Message-ID: <CA+QBN9DRUMkd+cOvHMJfe_-7rdhUpb=BiC7BBWN2ZS5-fNXtfw@mail.gmail.com>
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

hi
when (which kernel future release?) do you think it will be possible
to have a working PCI subsystem with SGI IP30? I'd love to use a
PCI_EHCI card, and a PCI_SATA card for a couple of practical projects.

please let me know
