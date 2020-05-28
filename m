Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA8E1E608B
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 14:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388549AbgE1MPS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 08:15:18 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:54369 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388659AbgE1MPR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 08:15:17 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MfqGN-1j6sUk1oFt-00gEJo; Thu, 28 May 2020 14:15:15 +0200
Received: by mail-qk1-f174.google.com with SMTP id n11so2769561qkn.8;
        Thu, 28 May 2020 05:15:15 -0700 (PDT)
X-Gm-Message-State: AOAM530eKgfPfR5PdBX4eCwMWStmPyQPjtpYBIY0fndvl2K15JFOiGlu
        CakNANWiAUbopkPYbPFD0qDkvRxwK9Zj2Q/bn3Y=
X-Google-Smtp-Source: ABdhPJzfvNuWOK1guCUgGeDY9M6FaFux05A8VHIga2dOSCy+tzyHgBzVaEldI6eWyDK3W7PJaJeMxRayBbXPfPlTj4w=
X-Received: by 2002:a37:554:: with SMTP id 81mr2404916qkf.394.1590668114112;
 Thu, 28 May 2020 05:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
 <20200526125928.17096-5-Sergey.Semin@baikalelectronics.ru> <CAHp75VcfkPPy5YjNrcv8c6doyQz5C47QyREE0v6tfQjXYrBijQ@mail.gmail.com>
In-Reply-To: <CAHp75VcfkPPy5YjNrcv8c6doyQz5C47QyREE0v6tfQjXYrBijQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 28 May 2020 14:14:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2WMqTRitUU86hSV3HSK12-hF_RDoFg51PRGTLmXwznvA@mail.gmail.com>
Message-ID: <CAK8P3a2WMqTRitUU86hSV3HSK12-hF_RDoFg51PRGTLmXwznvA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] bus: Add Baikal-T1 AXI-bus driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "soc@kernel.org" <soc@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2RUtEdOqoxSj6/D1h9kvoLb1M2nlEgh0R2kml8qcsCYZsg6LNsU
 RK+4wK1Qd664mKbXWRsZ9cIwj/y5djaxQ98y1xIPzQD30C63rRbKLhYW0T+BzU3sZCikgRf
 9s8tPmE2RT6XLK+94jUZJcCbbnXhUizu30vnz4WIWd36iWAQG1ajiaGKxoIHf19CIdWfldL
 jqqEf+JFWEljeJ1lpxEwg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CblSyl1ebiw=:i6q0CAHPMQemypmA1dhM1o
 OOgRwSosRJMn9cY/VVPboGDsdoN+D1Hjw7DM5Qw8DADANPB51C+6xp7hWqypgnyl0GpWWGs/I
 6pd7DIj39Bml30kMEQ8vzSwgfHL4RfjFcnuTdrZEkiNY8MDvgpsWkgZD5dqbZ7S04mGGH0bil
 POJ3pPNPmnOAvS6lu33ijdwIXXg4V9nyKmCSGgD8M6J/sI+Dmcw9yspSpECgYock5dCKRrDV3
 xepqCVf7eLrXqOhxqjItetWv/MXa5YVBmx0puJiWs21AcIZ+huN7kqa06+FZP2ujK0AdenVVl
 TGFdmmp2u0qCjMks5TZB2mwWzLh2D2T6sDfKK6AznBKFZ7JP+3XbitivwWj4bpIKMOSkDvsX9
 1X9w/ho3qhv8Iw28ijSQqjifdzcBfkuDQrJpkyksp/rWmHlBq3bl6PW5+Lik4GICTnFyEMH+S
 xg4xPnRzSSiJWt5vmj0qJ2spkSrGP9CHAZz5STv7Ix91t/lxsroOMT8n1M1iWMFZsqqi5Hmpi
 2AiZ/1Z49JwJ9Nqu32RTZZxp5cUGCl6b3K+2GFaz0wRzdbXkTTJrrv2MFQbzVX9dZ+sVQMVUa
 rjF6X5nfiFIWqfaZV3lariHRXc1l8MYfBcbEfawJJIkXXbkXYCULEA/bYlLxYEj55PYEQrDR9
 QXhSBnTTbB8sUotb91WRr5d5D221Cmk8aK3LgOcx9RMh9AK+w/w4v1qFErIr9MSH6JEV36EOL
 I6/FFZlz0P6nsv+F8FS3HZ3DKbFMeRBO9Yc5Svgx8PfU3AWNbjeRt60Is3xGrw8GrpTBdoTRJ
 5bZxrPaKTN/273H2HZpiSqTQx6eCwxTboWudX5L1aoZgud/x1s=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 28, 2020 at 12:01 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tuesday, May 26, 2020, Serge Semin <Sergey.Semin@baikalelectronics.ru> wrote:
>>
>> AXI3-bus is the main communication bus connecting all high-speed
>> peripheral IP-cores with RAM controller and MIPS P5600 cores on Baikal-T1
>> SoC. Bus traffic arbitration is done by means of DW AMBA 3 AXI
>> Interconnect (so called AXI Main Interconnect) routing IO requests from
>> one SoC block to another. This driver provides a way to detect any bus
>> protocol errors and device not responding situations by means of an
>> embedded on top of the interconnect errors handler block (EHB). AXI
>> Interconnect QoS arbitration tuning is currently unsupported.
>> The bus doesn't provide a way to detect the interconnected devices,
>> so they are supposed to be statically defined like by means of the
>> simple-bus sub-nodes.
>
>
>
> Few comments in case if you need a new version. Main point is about sysfs_streq().

I've applied the patch now and folded in fixes for the build warnings and
errors pointed out by the test robot, but I did not include the changes you
suggested.

Serge, could you send a follow-up patch to address those?

     Arnd
