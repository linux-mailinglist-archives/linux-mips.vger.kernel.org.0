Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099291E608E
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 14:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388656AbgE1MRk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 08:17:40 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:50337 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388556AbgE1MRj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 08:17:39 -0400
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MnpwC-1jFMmh2RMA-00pJ48; Thu, 28 May 2020 14:17:37 +0200
Received: by mail-qk1-f180.google.com with SMTP id 205so2817522qkg.3;
        Thu, 28 May 2020 05:17:37 -0700 (PDT)
X-Gm-Message-State: AOAM533bgo6TjMvJSO3UclDAwLw+NxLXP2deLshGtUYdT1PaSeksKGeQ
        X51tKRT7XpjxRCRk+mMpn2MszHdXMS/1rmKCOuo=
X-Google-Smtp-Source: ABdhPJyiHEmoUm3FgC49M+sAFInaSyXEhI+ENZgqiHVILIEFEm3iu5eYV31B+JBF1JL4HsB5MZy3H6qqFVw84hdPWmg=
X-Received: by 2002:a37:554:: with SMTP id 81mr2415677qkf.394.1590668253191;
 Thu, 28 May 2020 05:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru> <20200526125928.17096-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526125928.17096-6-Sergey.Semin@baikalelectronics.ru>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 28 May 2020 14:17:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1KT6G0pcLt56spm2O_Q5m_s+cdHfUrp2YUStS0wGigwQ@mail.gmail.com>
Message-ID: <CAK8P3a1KT6G0pcLt56spm2O_Q5m_s+cdHfUrp2YUStS0wGigwQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] bus: Add Baikal-T1 APB-bus driver
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:gqcTypKXfegn+1FpWmAP3n0+FQ9w9DRUmoRGQ4CSelsVN7rW9dK
 VQAFPqi42JplsyqjwaZnq0WcLU5gj69quvid6hDFo/UTxD2FDS0sa/1VOr5Dr99WQVeRGmb
 VSw8jiVv8qAa48tQGZdXkHnceIfjLftCQ5rfSVVohZycXgWBD6wwFA9s/I6P7ZbKsDqGnTN
 5LGqjOUxLOWXLgGQzPw9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P56ZwZSwquU=:qpr2EqGmU9lbPi3OyeTA9i
 37XBmap/IJqHROq+u/+agEArsMC1lcttFfogmHre99NpDNa9r+N2AgUA4kh8ALXpFoHOdQJZa
 a/AOHTIKpFNzY9jghEFB+1iSzAKILulaWdbp0+mohJignXwJY2JlTrPDXMaRVDG11Sa1UldPB
 hB3EqaKE67yY+q/rGlkq9wOFMKHS26zdJ5jymxZeD3dhEihE1xYFYFWJzQ7UozbrUuKzHGcZD
 10EzwJuiBP305SOzK8B9NM6BY9xzXDiRgQpf0PWAz015FrsljtxhalTxZSbo/xLwUCcepFp/M
 S4Aktm2kzRl0/fF6L41EEfzu9tKIfd2ZRgAFbqeRvccuTj90u8LRG6b9HaY04dxPmCZPlRr1D
 IF7Z3RVF1qcthSjrtpbYtwoboiEpKJNYP9N8eEhYuUw/QWmmcjz9uurjRtd/xTeTBjx96dGK5
 bnPMQJIwZekUHJhK+8PWEALanmV6wjN8BXx26SPUS8/FQcrPiobdgUjzNXLP+/QMOnDGurQnn
 YpkZm0rxspJ5ZYPgfiIzuTubKgr6nHRDHO6EBbP2YDPbGmtqPZeQszPFbDE6w5nIG4Z+dKcJR
 rDg0lYnzEz+dtavWnelfHYb6m4T3JE679FbDR3uli/FtG+mxi+CpCC5NmbdNSk8+lFoYAogIX
 GgqipjSvDsBBE5QGG2kMJNtyQzZkHwo3hfSiwxfEWGJZupzlZsWhQCB+KQhDuAcRgNcevC92K
 ovcmzY684e/52qCoX8hC91plAO5OElu1JIHV1p84repTv6GrMnsV9QdQCoqf9A0P25C+NqJgy
 QLMOWPhe0rNuNAahxe26asnAfJGElpVXV9LeNEndTpNImmvXIM=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 2:59 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Baikal-T1 AXI-APB bridge is used to access the SoC subsystem CSRs.
> IO requests are routed to this bus by means of the DW AMBA 3 AXI
> Interconnect. In case if an attempted APB transaction stays with no
> response for a pre-defined time an interrupt occurs and the bus gets
> freed for a next operation. This driver provides the interrupt handler
> to detect the erroneous address, prints an error message about the
> address fault, updates an errors counter. The counter and the APB-bus
> operations timeout can be accessed via corresponding sysfs nodes.
> A dedicated sysfs-node can be also used to artificially cause the
> bus errors described above.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: soc@kernel.org
> Cc: devicetree@vger.kernel.org
>
> ---

Applied with this fixup:

--- a/drivers/bus/bt1-apb.c
+++ b/drivers/bus/bt1-apb.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/nmi.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/clk.h>
 #include <linux/reset.h>
@@ -309,13 +310,13 @@ static ssize_t timeout_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(timeout);

-static int inject_error_show(struct device *dev, struct device_attribute *attr,
+static ssize_t inject_error_show(struct device *dev, struct
device_attribute *attr,
                             char *buf)
 {
        return scnprintf(buf, PAGE_SIZE, "Error injection: nodev irq\n");
 }

-static int inject_error_store(struct device *dev,
+static ssize_t inject_error_store(struct device *dev,
                              struct device_attribute *attr,
                              const char *data, size_t count)
 {
