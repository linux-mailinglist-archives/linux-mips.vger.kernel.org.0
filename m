Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0D9B23C4
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbfIMP77 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 11:59:59 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25459 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728811AbfIMP76 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 11:59:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568390366; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=SLLlGc9nv+SD9CgdET16ANDVpnhBzDuR2sh4VVT9nLaLPzoBudiYAhT1wKIEs5rF5bTsBEMP5ZJCapcyYmZFaBe50oLlIrNIoytj9gLi+coZZli4u0jSS4gxQuJLCbcthLFsGz1HJiqRwgIx8QLbbBrX5+m5TjCX4brSjrrYomw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1568390366; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=IL7XvFCTAWRH0WfapoAjEN/ppfvJmC4N1IUgD1yn/nU=; 
        b=bkuCYM/LLnwobDGxQSHTD/9ebvQ7AH273OiDlL6Yule0LqCB2khIbjrk4fiyc1ZxrcIt9IRT+8g6aM00ORZC6D+3EVnZS4DnLF3aUa34zgva8Tm0dHBWmHVpEo4CXg8ymHym/XVwOP14Lj5jqpXHqC5RVusP7st5AfsgnV0obcA=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=gb2yf8aMBgQQUV+YAfFw71i28sSXMDTY2vr+r1YrSH+AEoExjUOno+AksLgMbDhT768pTbTHGEV4
    ugNpIPh23j5oJ3YpvA7DPIIjVilRFvERq7gvH3Cuzmx7QWfO+P2a  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1568390366;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=4148; bh=IL7XvFCTAWRH0WfapoAjEN/ppfvJmC4N1IUgD1yn/nU=;
        b=i+EsRJLFX8bCwgiMZZeDMqINI/z9o2D5LXEBhGLDNMap+c4D1iRReuwfwxdLbvo/
        EjPwPLeA9GjlcSQaUlYZV+cfxOMMQDBnoJWhRFGxlh6iNtaVuMiuyxbkpCzAjIsC/Gy
        FrkzMTx+ZSBjWzg+pczu35ELjAUnxuSyPNBW0XDQ=
Received: from [192.168.88.140] (171.221.112.87 [171.221.112.87]) by mx.zohomail.com
        with SMTPS id 1568390363342552.6980296947244; Fri, 13 Sep 2019 08:59:23 -0700 (PDT)
Subject: Re: [PATCH 1/4] MMC: Ingenic: Adjust the macro definition name.
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-mips@vger.kernel.org
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
 <1567669089-88693-2-git-send-email-zhouyanjie@zoho.com>
 <e9ef3a9093e8572eb3be2aa654dd30069c493a4b.camel@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, malat@debian.org, yuehaibing@huawei.com,
        robh+dt@kernel.org, mark.rutland@arm.com, syq@debian.org,
        jiaxun.yang@flygoat.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D7BBCCF.2010600@zoho.com>
Date:   Fri, 13 Sep 2019 23:59:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <e9ef3a9093e8572eb3be2aa654dd30069c493a4b.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Ezequiel,

On 2019=E5=B9=B409=E6=9C=8813=E6=97=A5 23:32, Ezequiel Garcia wrote:
> Hi Zhou,
>
> Thanks for your interest in this driver, I'm glad
> so see it's more used.
>
> On Thu, 2019-09-05 at 15:38 +0800, Zhou Yanjie wrote:
>> Adjust the macro definition name to match the corresponding
>> register name in the datasheet.
>>
> It's not really an issue to have slighlt different
> names on the macros. They are currently sufficiently
> descriptive, and I don't think it's deserves a patch.
Thanks for your advice, I'll drop this in v2. Do you have any suggestions
for the other three patches?

Best regards!
>
> Thanks,
> Ezequiel
>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>   drivers/mmc/host/jz4740_mmc.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc=
.c
>> index ffdbfaa..1b1fcb7 100644
>> --- a/drivers/mmc/host/jz4740_mmc.c
>> +++ b/drivers/mmc/host/jz4740_mmc.c
>> @@ -28,7 +28,7 @@
>>   #include <asm/mach-jz4740/dma.h>
>>  =20
>>   #define JZ_REG_MMC_STRPCL=090x00
>> -#define JZ_REG_MMC_STATUS=090x04
>> +#define JZ_REG_MMC_STAT=09=090x04
>>   #define JZ_REG_MMC_CLKRT=090x08
>>   #define JZ_REG_MMC_CMDAT=090x0C
>>   #define JZ_REG_MMC_RESTO=090x10
>> @@ -40,7 +40,7 @@
>>   #define JZ_REG_MMC_IREG=09=090x28
>>   #define JZ_REG_MMC_CMD=09=090x2C
>>   #define JZ_REG_MMC_ARG=09=090x30
>> -#define JZ_REG_MMC_RESP_FIFO=090x34
>> +#define JZ_REG_MMC_RES=09=090x34
>>   #define JZ_REG_MMC_RXFIFO=090x38
>>   #define JZ_REG_MMC_TXFIFO=090x3C
>>   #define JZ_REG_MMC_DMAC=09=090x44
>> @@ -391,7 +391,7 @@ static void jz4740_mmc_clock_disable(struct jz4740_m=
mc_host *host)
>>  =20
>>   =09writew(JZ_MMC_STRPCL_CLOCK_STOP, host->base + JZ_REG_MMC_STRPCL);
>>   =09do {
>> -=09=09status =3D readl(host->base + JZ_REG_MMC_STATUS);
>> +=09=09status =3D readl(host->base + JZ_REG_MMC_STAT);
>>   =09} while (status & JZ_MMC_STATUS_CLK_EN && --timeout);
>>   }
>>  =20
>> @@ -403,7 +403,7 @@ static void jz4740_mmc_reset(struct jz4740_mmc_host =
*host)
>>   =09writew(JZ_MMC_STRPCL_RESET, host->base + JZ_REG_MMC_STRPCL);
>>   =09udelay(10);
>>   =09do {
>> -=09=09status =3D readl(host->base + JZ_REG_MMC_STATUS);
>> +=09=09status =3D readl(host->base + JZ_REG_MMC_STAT);
>>   =09} while (status & JZ_MMC_STATUS_IS_RESETTING && --timeout);
>>   }
>>  =20
>> @@ -446,7 +446,7 @@ static void jz4740_mmc_transfer_check_state(struct j=
z4740_mmc_host *host,
>>   {
>>   =09int status;
>>  =20
>> -=09status =3D readl(host->base + JZ_REG_MMC_STATUS);
>> +=09status =3D readl(host->base + JZ_REG_MMC_STAT);
>>   =09if (status & JZ_MMC_STATUS_WRITE_ERROR_MASK) {
>>   =09=09if (status & (JZ_MMC_STATUS_TIMEOUT_WRITE)) {
>>   =09=09=09host->req->cmd->error =3D -ETIMEDOUT;
>> @@ -580,10 +580,10 @@ static bool jz4740_mmc_read_data(struct jz4740_mmc=
_host *host,
>>   =09/* For whatever reason there is sometime one word more in the fifo =
then
>>   =09 * requested */
>>   =09timeout =3D 1000;
>> -=09status =3D readl(host->base + JZ_REG_MMC_STATUS);
>> +=09status =3D readl(host->base + JZ_REG_MMC_STAT);
>>   =09while (!(status & JZ_MMC_STATUS_DATA_FIFO_EMPTY) && --timeout) {
>>   =09=09d =3D readl(fifo_addr);
>> -=09=09status =3D readl(host->base + JZ_REG_MMC_STATUS);
>> +=09=09status =3D readl(host->base + JZ_REG_MMC_STAT);
>>   =09}
>>  =20
>>   =09return false;
>> @@ -614,7 +614,7 @@ static void jz4740_mmc_read_response(struct jz4740_m=
mc_host *host,
>>   {
>>   =09int i;
>>   =09uint16_t tmp;
>> -=09void __iomem *fifo_addr =3D host->base + JZ_REG_MMC_RESP_FIFO;
>> +=09void __iomem *fifo_addr =3D host->base + JZ_REG_MMC_RES;
>>  =20
>>   =09if (cmd->flags & MMC_RSP_136) {
>>   =09=09tmp =3D readw(fifo_addr);
>> @@ -797,7 +797,7 @@ static irqreturn_t jz_mmc_irq(int irq, void *devid)
>>   =09struct mmc_command *cmd =3D host->cmd;
>>   =09uint32_t irq_reg, status, tmp;
>>  =20
>> -=09status =3D readl(host->base + JZ_REG_MMC_STATUS);
>> +=09status =3D readl(host->base + JZ_REG_MMC_STAT);
>>   =09irq_reg =3D jz4740_mmc_read_irq_reg(host);
>>  =20
>>   =09tmp =3D irq_reg;
>
>



