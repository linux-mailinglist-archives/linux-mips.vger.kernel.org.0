Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72214404D8
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 23:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhJ2VX1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 17:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbhJ2VX1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 17:23:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B249C061570;
        Fri, 29 Oct 2021 14:20:58 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x27so23506092lfu.5;
        Fri, 29 Oct 2021 14:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=1sfAM6GudibWBt68svUssof2Ez+/QyHiOUFNYG234TU=;
        b=QJQAhIkdDOgHr4MAhf3n57EnI1hlRfagqBK6MJlsIG1pseoeBIrk2dtCrw6FbdFs5w
         DegCYfPT46PIo1MtlfZl3qouhAMhnCv/DYbgJw1xn4xCRTt9wobZtzqlTcv4/r88vBSd
         IpzILIbU+v81lQkPezcxIJ3GVgMJNY/WTWYGCKof2d4RLA4xI121iy96dhR7bTuhYnXp
         /fPzLW0gSdK7AXGqrK87FJs2+OFA6sCqr79aAMKEipR01a1kJIUbxIHM7iB/Bnpqgo+G
         r+KiZrxDoyvi54d0Bumz2ySpFoT50mSBGA8LZRW9d3JKrP6ksoUHsvbNgXmNvKN9OkX5
         cXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1sfAM6GudibWBt68svUssof2Ez+/QyHiOUFNYG234TU=;
        b=1wMZslGKNKmA53E1vEANHZthAhFZ7fpDmzDgZwDNCUzOaX0g8kEVqOOQMmqzqbSlet
         kcQ4Ojn3Sc9E0PQSt2a75KpR9gbVBUlRExWdr8F+Ldf+b0aH71EdgqkahbyRtVdxQOWw
         RhsR/y8oBoKeG+wjcKMOKjjzo3isSzg9V4ElNkyQxyIEH/J3NuiY6XUM7lC+JOm0ErvL
         2igrnlAFAmdFjL48h+EiryL5NFhgHTeJH3N+v8OhoaV1O8hFb9bpw5Sn53ggfgT9mJKh
         fjb4hSi6WmSI1xwQRYy7WONpPgVywB0mIg0FCFra8kHPV0LCncY776YizwDG8cOB4vMh
         jRtg==
X-Gm-Message-State: AOAM530Pgd7DXwhGj8KOAEMrpZoIgXiRVJ8rbiwdnCbfyucBardR2fzA
        nNAFwBVTeiVScqi6TDlC9D8=
X-Google-Smtp-Source: ABdhPJxRXJwNGoiOWZEbZPMQUDlQot9o9P87aSzDG0qnf4e3496bBAdwBosERvN7O6W4Scqn1yitNA==
X-Received: by 2002:ac2:5304:: with SMTP id c4mr12480077lfh.687.1635542456303;
        Fri, 29 Oct 2021 14:20:56 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id bt10sm705048lfb.193.2021.10.29.14.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 14:20:55 -0700 (PDT)
Message-ID: <1740a113-adf5-ed67-5276-239aff304592@gmail.com>
Date:   Fri, 29 Oct 2021 23:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH 2/2] dt-bindings: mfd: add Broadcom's timer MFD block
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211029202505.7106-1-zajec5@gmail.com>
 <20211029202505.7106-2-zajec5@gmail.com>
 <4d4334f0-c76f-f205-8c4c-a66a41809266@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <4d4334f0-c76f-f205-8c4c-a66a41809266@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29.10.2021 23:03, Florian Fainelli wrote:
> On 10/29/21 1:25 PM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This block is called timer in documentation but it actually behaves like
>> a MFD.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   .../bindings/mfd/brcm,timer-mfd.yaml          | 64 +++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml b/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
>> new file mode 100644
>> index 000000000000..0060b6c443a7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
>> @@ -0,0 +1,64 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/brcm,timer-mfd.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom's timer MFD
>> +
>> +maintainers:
>> +  - Rafał Miłecki <rafal@milecki.pl>
>> +
>> +description: |
>> +  Broadcom's timer is a block used in multiple SoCs (e.g., BCM4908, BCM63xx,
>> +  BCM7038). Despite its name it's not strictly a timer device. It consists of:
>> +  timers, watchdog and software reset handler.
> 
> Small nit here, the software reset handler part is only present on the
> BCM63xx and BCM4908 (which is a derivative of 63xx) but not on the
> BCM7xxx chips.

Should I simply make it "and (optionally) software reset handler"?


> Also, there is some difference in how the registers are organized:

My complete summary if someone really wants to study that:

==> 4908_map_part.h <==
typedef struct Timer {
         uint32  TimerCtl0;              /* 0x00 */
         uint32  TimerCtl1;              /* 0x04 */
         uint32  TimerCtl2;              /* 0x08 */
         uint32  TimerCtl3;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */
         uint32  TimerCnt3;              /* 0x1c */
#define TIMER_COUNT_MASK                0x3FFFFFFF

         uint32  TimerMask;              /* 0x20 */
#define TIMER0EN                        0x00000001
#define TIMER1EN                        0x00000002
#define TIMER2EN                        0x00000004
#define TIMER3EN                        0x00000008

         uint32  TimerInts;              /* 0x24 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define TIMER3                          0x00000008
#define WATCHDOG                        0x00000010

         uint32  WatchDogDefCount;       /* 0x28 */

         /* Write 0xff00 0x00ff to Start timer
          * Write 0xee00 0x00ee to Stop and re-load default count
          * Read from this register returns current watch dog count
          */
         uint32  WatchDogCtl;            /* 0x2c */

         /* Number of 50-MHz ticks for WD Reset pulse to last */
         uint32  WDResetCount;           /* 0x30 */

         uint32  SoftRst;                /* 0x34 */
#define SOFT_RESET                      0x00000001

         uint32  ResetStatus;            /* 0x38 */
#define PCIE_RESET_STATUS               0x10000000
#define SW_RESET_STATUS                 0x20000000
#define HW_RESET_STATUS                 0x40000000
#define POR_RESET_STATUS                0x80000000
#define RESET_STATUS_MASK               0xF0000000

         uint32  ResetReason;            /* 0x3c */

         uint32  spare[3];               /* 0x40-0x4b */
} Timer;


==> 60333_map_part.h <==
typedef struct Timer {
         uint32  TimerInts;              /* 0x00 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define WATCHDOG                        0x00000008
#define TIMER0_MASK                     0x00000100
#define TIMER1_MASK                     0x00000200
#define TIMER2_MASK                     0x00000400

         uint32  TimerCtl0;              /* 0x04 */
         uint32  TimerCtl1;              /* 0x08 */
         uint32  TimerCtl2;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */
#define TIMER_COUNT_MASK                0x3FFFFFFF

         uint32  WatchDogDefCount;       /* 0x1c */

         /* Write 0xff00 0x00ff to Start timer
          * Write 0xee00 0x00ee to Stop and re-load default count
          * Read from this register returns current watch dog count
          */
         uint32  WatchDogCtl;            /* 0x20 */

         /* Number of 50-MHz ticks for WD Reset pulse to last */
         uint32  WDResetCount;           /* 0x24 */

         uint32  SoftRst;                /* 0x28 */
#define SOFT_RESET                      0x00000001
} Timer;


==> 63138_map_part.h <==
typedef struct Timer {
         uint32  TimerCtl0;              /* 0x00 */
         uint32  TimerCtl1;              /* 0x04 */
         uint32  TimerCtl2;              /* 0x08 */
         uint32  TimerCtl3;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */
         uint32  TimerCnt3;              /* 0x1c */
#define TIMER_COUNT_MASK                0x3FFFFFFF

         uint32  TimerMask;              /* 0x20 */
#define TIMER0EN                        0x00000001
#define TIMER1EN                        0x00000002
#define TIMER2EN                        0x00000004
#define TIMER3EN                        0x00000008

         uint32  TimerInts;              /* 0x24 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define TIMER3                          0x00000008
#define WATCHDOG                        0x00000010

         uint32  WatchDogDefCount;       /* 0x28 */

         /* Write 0xff00 0x00ff to Start timer
          * Write 0xee00 0x00ee to Stop and re-load default count
          * Read from this register returns current watch dog count
          */
         uint32  WatchDogCtl;            /* 0x2c */

         /* Number of 50-MHz ticks for WD Reset pulse to last */
         uint32  WDResetCount;           /* 0x30 */

         uint32  SoftRst;                /* 0x34 */
#define SOFT_RESET                      0x00000001

         uint32  ResetStatus;            /* 0x38 */
#define PCIE_RESET_STATUS               0x10000000
#define SW_RESET_STATUS                 0x20000000
#define HW_RESET_STATUS                 0x40000000
#define POR_RESET_STATUS                0x80000000
#define RESET_STATUS_MASK               0xF0000000
} Timer;


==> 63148_map_part.h <==
typedef struct Timer {
         uint32  TimerCtl0;              /* 0x00 */
         uint32  TimerCtl1;              /* 0x04 */
         uint32  TimerCtl2;              /* 0x08 */
         uint32  TimerCtl3;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */
         uint32  TimerCnt3;              /* 0x1c */
#define TIMER_COUNT_MASK                0x3FFFFFFF

         uint32  TimerMask;              /* 0x20 */
#define TIMER0EN                        0x00000001
#define TIMER1EN                        0x00000002
#define TIMER2EN                        0x00000004
#define TIMER3EN                        0x00000008

         uint32  TimerInts;              /* 0x24 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define TIMER3                          0x00000008
#define WATCHDOG                        0x00000010

         uint32  WatchDogDefCount;       /* 0x28 */

         /* Write 0xff00 0x00ff to Start timer
          * Write 0xee00 0x00ee to Stop and re-load default count
          * Read from this register returns current watch dog count
          */
         uint32  WatchDogCtl;            /* 0x2c */

         /* Number of 50-MHz ticks for WD Reset pulse to last */
         uint32  WDResetCount;           /* 0x30 */

         uint32  SoftRst;                /* 0x34 */
#define SOFT_RESET                      0x00000001

         uint32  ResetStatus;            /* 0x38 */
#define PCIE_RESET_STATUS               0x10000000
#define SW_RESET_STATUS                 0x20000000
#define HW_RESET_STATUS                 0x40000000
#define POR_RESET_STATUS                0x80000000
#define RESET_STATUS_MASK               0xF0000000
} Timer;


==> 63268_map_part.h <==
typedef struct Timer {
         uint16  unused0;                /* 0x00 */

         byte    TimerMask;              /* 0x02 */
#define TIMER0EN                        0x00000001
#define TIMER1EN                        0x00000002
#define TIMER2EN                        0x00000004

         byte    TimerInts;              /* 0x03 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define WATCHDOG                        0x00000008

         uint32  TimerCtl0;              /* 0x04 */
         uint32  TimerCtl1;              /* 0x08 */
         uint32  TimerCtl2;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */

         uint32  WatchDogDefCount;       /* 0x1c */

         /* Write 0xff00 0x00ff to Start timer
          * Write 0xee00 0x00ee to Stop and re-load default count
          * Read from this register returns current watch dog count
          */
         uint32  WatchDogCtl;            /* 0x20 */

         /* Number of 50-MHz ticks for WD Reset pulse to last */
         uint32  WDResetCount;           /* 0x24 */

         uint32  EnSwPLL;                /* 0x28 */
         uint32  ClkRstCtl;              /* 0x2c */
#define POR_RESET_STATUS                (1 << 31)
#define HW_RESET_STATUS                 (1 << 30)
#define SW_RESET_STATUS                 (1 << 29)
#define USB_REF_CLKEN                   (1 << 18)
#define UTO_EXTIN_CLKEN                 (1 << 17)
#define UTO_CLK50_SEL                   (1 << 16)
#define FAP2_PLL_CLKEN                  (1 << 15)
#define FAP2_PLL_FREQ_SHIFT             12
#define FAP1_PLL_CLKEN                  (1 << 11)
#define FAP1_PLL_FREQ_SHIFT             8
#define WAKEON_DSL                      (1 << 7)
#define WAKEON_EPHY                     (1 << 6)
#define DSL_ENERGY_DETECT_ENABLE        (1 << 4)
#define GPHY_1_ENERGY_DETECT_ENABLE     (1 << 3)
#define EPHY_3_ENERGY_DETECT_ENABLE     (1 << 2)
#define EPHY_2_ENERGY_DETECT_ENABLE     (1 << 1)
#define EPHY_1_ENERGY_DETECT_ENABLE     (1 << 0)
} Timer;


==> 63381_map_part.h <==
typedef struct Timer {
         uint32  TimerCtl0;              /* 0x00 */
         uint32  TimerCtl1;              /* 0x04 */
         uint32  TimerCtl2;              /* 0x08 */
         uint32  TimerCtl3;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */
         uint32  TimerCnt3;              /* 0x1c */
#define TIMER_COUNT_MASK                0x3FFFFFFF

         uint32  TimerMask;              /* 0x20 */
#define TIMER0EN                        0x00000001
#define TIMER1EN                        0x00000002
#define TIMER2EN                        0x00000004
#define TIMER3EN                        0x00000008

         uint32  TimerInts;              /* 0x24 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define TIMER3                          0x00000008
#define WATCHDOG                        0x00000010

         uint32  WatchDogDefCount;       /* 0x28 */

         /* Write 0xff00 0x00ff to Start timer
          * Write 0xee00 0x00ee to Stop and re-load default count
          * Read from this register returns current watch dog count
          */
         uint32  WatchDogCtl;            /* 0x2c */

         /* Number of 50-MHz ticks for WD Reset pulse to last */
         uint32  WDResetCount;           /* 0x30 */

         uint32  SoftRst;                /* 0x34 */
#define SOFT_RESET                      0x00000001

         uint32  ResetStatus;            /* 0x38 */
#define PCIE_RESET_STATUS               0x10000000
#define SW_RESET_STATUS                 0x20000000
#define HW_RESET_STATUS                 0x40000000
#define POR_RESET_STATUS                0x80000000
#define RESET_STATUS_MASK               0xF0000000
} Timer;


==> 68360_map_part.h <==
typedef struct Timer {
         uint32  TimerCtl0;              /* 0x00 */
         uint32  TimerCtl1;              /* 0x04 */
         uint32  TimerCtl2;              /* 0x08 */
         uint32  TimerCtl3;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */
         uint32  TimerCnt3;              /* 0x1c */
#define TIMER_COUNT_MASK                0x3FFFFFFF

         uint32  TimerMask;              /* 0x20 */
#define TIMER0EN                        0x00000001
#define TIMER1EN                        0x00000002
#define TIMER2EN                        0x00000004
#define TIMER3EN                        0x00000008

         uint32  TimerInts;              /* 0x24 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define TIMER3                          0x00000008
#define WATCHDOG                        0x00000010

         uint32  WatchDogDefCount;       /* 0x28 */

         /* Write 0xff00 0x00ff to Start timer
          * Write 0xee00 0x00ee to Stop and re-load default count
          * Read from this register returns current watch dog count
          */
         uint32  WatchDogCtl;            /* 0x2c */

         /* Number of 50-MHz ticks for WD Reset pulse to last */
         uint32  WDResetCount;           /* 0x30 */

         uint32  SoftRst;                /* 0x34 */
#define SOFT_RESET                      0x00000001

         uint32  ResetStatus;            /* 0x38 */
#define PCIE_RESET_STATUS               0x10000000
#define SW_RESET_STATUS                 0x20000000
#define HW_RESET_STATUS                 0x40000000
#define POR_RESET_STATUS                0x80000000
#define RESET_STATUS_MASK               0xF0000000

         uint32  ResetReason;            /* 0x3c */
#define SW_INI_RESET                    0x00000001

         uint32  spare[3];
} Timer;


==> 6838_map_part.h <==
typedef struct Timer {
         uint16  unused0;                /* 0x00 */

         byte    TimerMask;              /* 0x02 */
#define TIMER0EN                        0x00000001
#define TIMER1EN                        0x00000002
#define TIMER2EN                        0x00000004

         byte    TimerInts;              /* 0x03 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define WATCHDOG0                       0x00000008
#define WATCHDOG                        WATCHDOG0 /* compatible with other chips */
#define WATCHDOG1                       0x00000010

         uint32  TimerCtl0;              /* 0x04 */
         uint32  TimerCtl1;              /* 0x08 */
         uint32  TimerCtl2;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */
#define TIMER_COUNT_MASK                0x3FFFFFFF

         uint32  TimerMemTm;             /* 0x20 unused */
         uint32  TimerEphyTestCtrl;      /* 0x24 */
} Timer;


==> 6848_map_part.h <==
typedef struct Timer {
         uint32  TimerCtl0;              /* 0x00 */
         uint32  TimerCtl1;              /* 0x04 */
         uint32  TimerCtl2;              /* 0x08 */
         uint32  TimerCtl3;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */
         uint32  TimerCnt3;              /* 0x1c */
#define TIMER_COUNT_MASK                0x3FFFFFFF

         uint32  TimerMask;              /* 0x20 */
#define TIMER0EN                        0x00000001
#define TIMER1EN                        0x00000002
#define TIMER2EN                        0x00000004
#define TIMER3EN                        0x00000008

         uint32  TimerInts;              /* 0x24 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define TIMER3                          0x00000008
#define WATCHDOG                        0x00000010

         uint32  WatchDogDefCount;       /* 0x28 */

         /* Write 0xff00 0x00ff to Start timer
          * Write 0xee00 0x00ee to Stop and re-load default count
          * Read from this register returns current watch dog count
          */
         uint32  WatchDogCtl;            /* 0x2c */

         /* Number of 50-MHz ticks for WD Reset pulse to last */
         uint32  WDResetCount;           /* 0x30 */

         uint32  SoftRst;                /* 0x34 */
#define SOFT_RESET                      0x00000001

         uint32  ResetStatus;            /* 0x38 */
#define PCIE_RESET_STATUS               0x10000000
#define SW_RESET_STATUS                 0x20000000
#define HW_RESET_STATUS                 0x40000000
#define POR_RESET_STATUS                0x80000000
#define RESET_STATUS_MASK               0xF0000000

         uint32  ResetReason;            /* 0x3c */
#define SW_INI_RESET                    0x00000001

         uint32  spare[3];               /* 0x40-0x4b */
} Timer;


==> 6858_map_part.h <==
typedef struct Timer {
         uint32  TimerCtl0;              /* 0x00 */
         uint32  TimerCtl1;              /* 0x04 */
         uint32  TimerCtl2;              /* 0x08 */
         uint32  TimerCtl3;              /* 0x0c */
#define TIMERENABLE                     0x80000000
#define RSTCNTCLR                       0x40000000

         uint32  TimerCnt0;              /* 0x10 */
         uint32  TimerCnt1;              /* 0x14 */
         uint32  TimerCnt2;              /* 0x18 */
         uint32  TimerCnt3;              /* 0x1c */
#define TIMER_COUNT_MASK                0x3FFFFFFF

         uint32  TimerMask;              /* 0x20 */
#define TIMER0EN                        0x00000001
#define TIMER1EN                        0x00000002
#define TIMER2EN                        0x00000004
#define TIMER3EN                        0x00000008

         uint32  TimerInts;              /* 0x24 */
#define TIMER0                          0x00000001
#define TIMER1                          0x00000002
#define TIMER2                          0x00000004
#define TIMER3                          0x00000008
#define WATCHDOG                        0x00000010

         uint32  WatchDogDefCount;       /* 0x28 */

         /* Write 0xff00 0x00ff to Start timer
          * Write 0xee00 0x00ee to Stop and re-load default count
          * Read from this register returns current watch dog count
          */
         uint32  WatchDogCtl;            /* 0x2c */

         /* Number of 50-MHz ticks for WD Reset pulse to last */
         uint32  WDResetCount;           /* 0x30 */

         uint32  SoftRst;                /* 0x34 */
#define SOFT_RESET                      0x00000001

         uint32  ResetStatus;            /* 0x38 */
#define PCIE_RESET_STATUS               0x10000000
#define SW_RESET_STATUS                 0x20000000
#define HW_RESET_STATUS                 0x40000000
#define POR_RESET_STATUS                0x80000000
#define RESET_STATUS_MASK               0xF0000000

         uint32  ResetReason;            /* 0x3c */
#define SW_INI_RESET                    0x00000001

         uint32  spare[3];
} Timer;
