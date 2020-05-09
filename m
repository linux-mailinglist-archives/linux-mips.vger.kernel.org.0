Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865BD1CC00C
	for <lists+linux-mips@lfdr.de>; Sat,  9 May 2020 11:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgEIJpQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 May 2020 05:45:16 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:39894 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgEIJpQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 May 2020 05:45:16 -0400
Received: by mail-il1-f193.google.com with SMTP id r2so3760367ilo.6;
        Sat, 09 May 2020 02:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ixvi5cH52QFRH8JcnvoBtXBDpHulut9OBY2UXdoFzNk=;
        b=nFY99wP3c9pdSTUl8Uov6qhEuVkK4aMmzDR/7l9MmGY4MJtLwkBuGfFu3MqetmuSkb
         Ub5t+3Esv55wyeL4PU79TICUszTieURyeJJv/ZGTN2Gn99wsdLmoopkSQZEJfDY/CtIS
         phyhbKo4VmqdL354ayCBWZVAS0LevPZhI9VvkgnCMW8ncME/mqKcMBl3LSpvoxgbEJGa
         pfbd3NoLcCge1snjWctiwZ3jRTaxgGPdTPcDPADsyDPE9n3f8P6WeNfOyvgRlnAco2H1
         i03M31YdZeeZO9JHL4LseK96YFOAtxQaWhLTobbspsfiB4dE5ORhNJjwyMw2fAFVEhr0
         w85g==
X-Gm-Message-State: AGi0PuYBMBF9ebj6VimjDEbTXhdH91KDSW+O/U6A76z+cn0n77aT335j
        4VeRBbLSbhzRi8KCga5YKlMYj7W+Tm9seDTdgcqZN+14
X-Google-Smtp-Source: APiQypIL4uDqNhjoW8ACYwhOCMGqholXKO9mdIuyKFA66hLXur+bRKaQrbxTYbuCq6QT6AheAC1r/kBNpaAjbXvsVDc=
X-Received: by 2002:a92:bad5:: with SMTP id t82mr7419606ill.171.1589017514883;
 Sat, 09 May 2020 02:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <1589008364-2294-1-git-send-email-yangtiezhu@loongson.cn> <1589008364-2294-2-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1589008364-2294-2-git-send-email-yangtiezhu@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 9 May 2020 17:52:56 +0800
Message-ID: <CAAhV-H5zhwHgtbLXPuj5mcGnv5zfT7iRcxoBdk-rbPTn3vt=RQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] MIPS: Loongson: Cleanup cpu_hwmon.c
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Tiezhu,

On Sat, May 9, 2020 at 3:13 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> Fix the following checkpatch warnings and errors:
>
> ERROR: do not initialise statics to 0
> #14: FILE: drivers/platform/mips/cpu_hwmon.c:14:
> +static int csr_temp_enable = 0;
I know you are doing things by checkpatch, but I really don't know why
not initialise. I think initialise is more human-readable.

>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> #60: FILE: drivers/platform/mips/cpu_hwmon.c:60:
> +static SENSOR_DEVICE_ATTR(name, S_IRUGO, get_hwmon_name, NULL, 0);
And so does this.

>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> #84: FILE: drivers/platform/mips/cpu_hwmon.c:84:
> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, get_cpu_temp, NULL, 1);
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> #85: FILE: drivers/platform/mips/cpu_hwmon.c:85:
> +static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, cpu_temp_label, NULL, 1);
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> #86: FILE: drivers/platform/mips/cpu_hwmon.c:86:
> +static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, get_cpu_temp, NULL, 2);
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> #87: FILE: drivers/platform/mips/cpu_hwmon.c:87:
> +static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, cpu_temp_label, NULL, 2);
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> #88: FILE: drivers/platform/mips/cpu_hwmon.c:88:
> +static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, get_cpu_temp, NULL, 3);
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> #89: FILE: drivers/platform/mips/cpu_hwmon.c:89:
> +static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, cpu_temp_label, NULL, 3);
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> #90: FILE: drivers/platform/mips/cpu_hwmon.c:90:
> +static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, get_cpu_temp, NULL, 4);
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> #91: FILE: drivers/platform/mips/cpu_hwmon.c:91:
> +static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, cpu_temp_label, NULL, 4);
>
> WARNING: Missing a blank line after declarations
> #120: FILE: drivers/platform/mips/cpu_hwmon.c:120:
> +       int id = (to_sensor_dev_attr(attr))->index - 1;
> +       return sprintf(buf, "CPU %d Temperature\n", id);
>
> WARNING: Missing a blank line after declarations
> #128: FILE: drivers/platform/mips/cpu_hwmon.c:128:
> +       int value = loongson3_cpu_temp(id);
> +       return sprintf(buf, "%d\n", value);
>
> ERROR: spaces required around that '=' (ctx:VxV)
> #135: FILE: drivers/platform/mips/cpu_hwmon.c:135:
> +       for (i=0; i<nr_packages; i++)
>               ^
>
> ERROR: spaces required around that '<' (ctx:VxV)
> #135: FILE: drivers/platform/mips/cpu_hwmon.c:135:
> +       for (i=0; i<nr_packages; i++)
>                    ^
>
> ERROR: spaces required around that '=' (ctx:VxV)
> #145: FILE: drivers/platform/mips/cpu_hwmon.c:145:
> +       for (i=0; i<nr_packages; i++)
>               ^
>
> ERROR: spaces required around that '<' (ctx:VxV)
> #145: FILE: drivers/platform/mips/cpu_hwmon.c:145:
> +       for (i=0; i<nr_packages; i++)
>                    ^
>
> ERROR: spaces required around that '=' (ctx:VxV)
> #156: FILE: drivers/platform/mips/cpu_hwmon.c:156:
> +       for (i=0; i<nr_packages; i++) {
>               ^
>
> ERROR: spaces required around that '<' (ctx:VxV)
> #156: FILE: drivers/platform/mips/cpu_hwmon.c:156:
> +       for (i=0; i<nr_packages; i++) {
>                    ^
>
> WARNING: line over 80 characters
> #175: FILE: drivers/platform/mips/cpu_hwmon.c:175:
> +               csr_temp_enable = csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_TEMP;
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/platform/mips/cpu_hwmon.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
> index 0d27cb7..fa42b13 100644
> --- a/drivers/platform/mips/cpu_hwmon.c
> +++ b/drivers/platform/mips/cpu_hwmon.c
> @@ -11,7 +11,7 @@
>  #include <loongson_hwmon.h>
>  #include <loongson_regs.h>
>
> -static int csr_temp_enable = 0;
> +static int csr_temp_enable;
>
>  /*
>   * Loongson-3 series cpu has two sensors inside,
> @@ -44,7 +44,7 @@ int loongson3_cpu_temp(int cpu)
>         case PRID_REV_LOONGSON3A_R3_0:
>         case PRID_REV_LOONGSON3A_R3_1:
>         default:
> -               reg = (reg & 0xffff)*731/0x4000 - 273;
> +               reg = (reg & 0xffff) * 731 / 0x4000 - 273;
>                 break;
>         }
>
> @@ -57,7 +57,7 @@ static struct device *cpu_hwmon_dev;
>
>  static ssize_t get_hwmon_name(struct device *dev,
>                         struct device_attribute *attr, char *buf);
> -static SENSOR_DEVICE_ATTR(name, S_IRUGO, get_hwmon_name, NULL, 0);
> +static SENSOR_DEVICE_ATTR(name, 0444, get_hwmon_name, NULL, 0);
>
>  static struct attribute *cpu_hwmon_attributes[] = {
>         &sensor_dev_attr_name.dev_attr.attr,
> @@ -81,14 +81,14 @@ static ssize_t get_cpu_temp(struct device *dev,
>  static ssize_t cpu_temp_label(struct device *dev,
>                         struct device_attribute *attr, char *buf);
>
> -static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, get_cpu_temp, NULL, 1);
> -static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, cpu_temp_label, NULL, 1);
> -static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, get_cpu_temp, NULL, 2);
> -static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, cpu_temp_label, NULL, 2);
> -static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, get_cpu_temp, NULL, 3);
> -static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, cpu_temp_label, NULL, 3);
> -static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, get_cpu_temp, NULL, 4);
> -static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, cpu_temp_label, NULL, 4);
> +static SENSOR_DEVICE_ATTR(temp1_input, 0444, get_cpu_temp, NULL, 1);
> +static SENSOR_DEVICE_ATTR(temp1_label, 0444, cpu_temp_label, NULL, 1);
> +static SENSOR_DEVICE_ATTR(temp2_input, 0444, get_cpu_temp, NULL, 2);
> +static SENSOR_DEVICE_ATTR(temp2_label, 0444, cpu_temp_label, NULL, 2);
> +static SENSOR_DEVICE_ATTR(temp3_input, 0444, get_cpu_temp, NULL, 3);
> +static SENSOR_DEVICE_ATTR(temp3_label, 0444, cpu_temp_label, NULL, 3);
> +static SENSOR_DEVICE_ATTR(temp4_input, 0444, get_cpu_temp, NULL, 4);
> +static SENSOR_DEVICE_ATTR(temp4_label, 0444, cpu_temp_label, NULL, 4);
>
>  static const struct attribute *hwmon_cputemp[4][3] = {
>         {
> @@ -117,6 +117,7 @@ static ssize_t cpu_temp_label(struct device *dev,
>                         struct device_attribute *attr, char *buf)
>  {
>         int id = (to_sensor_dev_attr(attr))->index - 1;
> +
>         return sprintf(buf, "CPU %d Temperature\n", id);
>  }
>
> @@ -125,6 +126,7 @@ static ssize_t get_cpu_temp(struct device *dev,
>  {
>         int id = (to_sensor_dev_attr(attr))->index - 1;
>         int value = loongson3_cpu_temp(id);
> +
>         return sprintf(buf, "%d\n", value);
>  }
>
> @@ -132,7 +134,7 @@ static int create_sysfs_cputemp_files(struct kobject *kobj)
>  {
>         int i, ret = 0;
>
> -       for (i=0; i<nr_packages; i++)
> +       for (i = 0; i < nr_packages; i++)
>                 ret = sysfs_create_files(kobj, hwmon_cputemp[i]);
>
>         return ret;
> @@ -142,7 +144,7 @@ static void remove_sysfs_cputemp_files(struct kobject *kobj)
>  {
>         int i;
>
> -       for (i=0; i<nr_packages; i++)
> +       for (i = 0; i < nr_packages; i++)
>                 sysfs_remove_files(kobj, hwmon_cputemp[i]);
>  }
>
> @@ -153,7 +155,7 @@ static void do_thermal_timer(struct work_struct *work)
>  {
>         int i, value, temp_max = 0;
>
> -       for (i=0; i<nr_packages; i++) {
> +       for (i = 0; i < nr_packages; i++) {
>                 value = loongson3_cpu_temp(i);
>                 if (value > temp_max)
>                         temp_max = value;
> @@ -172,7 +174,8 @@ static int __init loongson_hwmon_init(void)
>         pr_info("Loongson Hwmon Enter...\n");
>
>         if (cpu_has_csr())
> -               csr_temp_enable = csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_TEMP;
> +               csr_temp_enable = csr_readl(LOONGSON_CSR_FEATURES) &
> +                                 LOONGSON_CSRF_TEMP;
>
>         cpu_hwmon_dev = hwmon_device_register(NULL);
>         if (IS_ERR(cpu_hwmon_dev)) {
> --
> 2.1.0
>
