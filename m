Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB08207260
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 13:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390671AbgFXLn2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 07:43:28 -0400
Received: from mout.web.de ([212.227.17.12]:34253 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390599AbgFXLn1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 07:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592998987;
        bh=4nD3xZDIdrrXNqbcIsuEUolBucAJ/ZjHdFbfFSTTLBo=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=BIqatGq0Tqz48RO0ZjzEMtXSfv/41kdSU91fX7aaFbs9+FWBl+wJ0rVD326xhGkma
         f4qkqpFW5PVqbhjut8nF7Ki4mnO0y8MAOuVTeVQEWxn3ST6c6cYPpDJiwGNT19R+lm
         MhksgeaHAF/IcvunKrkaxWn0y2ezxbu+Wv8qUspM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.175.204]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LnS4I-1jDK571BZ0-00heNa; Wed, 24
 Jun 2020 13:43:07 +0200
To:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 03/14] irqchip/csky-mpintc: Fix potential resource
 leaks
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a0ace7a8-5c26-ee20-fe76-7dff57a18ca3@web.de>
Date:   Wed, 24 Jun 2020 13:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2IBKEtW3O3lVwHqlJ5bew5gMPwzYtHNbSlFsFqxIX3c8LyGOZLT
 61tCgVkKED4uZIcALc95dsTrndHY0yqQXWLGtpKVERCbJOm1FwJhldhsHPRg260MklOIP/k
 gIOZ5QUoU3h1+PadtZCp7ikfCiRYe9ms91RoWLzG293KUjm2fwzihwmPadwv6cK3AuLPNtl
 +X6pep6LYbB49SEA8lLmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qUWh/iBaWT4=://cTtB3jmNNA2oCxyn9ow1
 YwXogPhXE314xjDTwcUHHt3xXV2IE16cV756PMKGZtNbeQbFiByk+fFjZwFVUBX3lOBIfT6Xm
 RpuBPYHoChKbOIYQIkM+bQ+JTTnH5MMlkLZTF1PsSG6e+wOfrh93RNQ7kYeimohjoNR0YELcl
 XBG3IU935abkpxBkcLevVkqGNCenDY5YJuxOveLB5pMqmHZJWdx7Yb/kXVL+dx0pdeWPW5KLE
 DQMlwI3iGaeUOOoNYBx2510Tl51WynbQ18A7/6a0chGvannbLmTCiz8lYoJ8ALGKCEbc1F+pD
 IYArDMg4TUyGL9ZIgNrvDaH8ULEilmS6ZcL5fZ7YnPWOHM3H8Dr8Wv1mmU9+rxgrSmLJqPq+2
 bvcTEzMwGk2pu9DXAeOreeqRXuRzrLB3Mwlc9FbYHHtRr/a5L/x9EF/wHEFP5nNKFJJL48lmO
 r09WsWFWmKAsFkwc3/YqxY6qvSLI8fg/kkJVsUouMaL3TXomt0D2af2oVBcbD1Du7EmAuJu87
 5dkmt2QpDGvQk+ZBtJUHQJLK621YoFIEqWzkaaz9EFkN7DCEQTdkv6yrQjmxTf7gThAkfTXw7
 Fmj506NNUHnLJzkQUnOJDGVY+LqzB/ftizTdDuOKpAHcasubUesdbnHEQpIDNL4RWdLjGlfpX
 dvKIEz6v/QGoC3t4C0BkPKc7aBSz2Q+5+3ScNw9RcUcpqcTX1csb/l2FIQJw61dq1A6+0CJtd
 JIViIlbgq6CC9URmOoQwMCdUkNDYmA1HuOki+8jooixbTsL9x7wUnaY6xhBYXTOznA40HPz8d
 ZDs2a1vKjCt7KT6olLWmXFFIB6v+kqpj0q8Wv7YiVMaKqt7bKrXMVSObt29AaFbr+cvITs8gC
 EYvTLhjWVBBZhg6vKD6D6BbPQlhHY5ZE1s9EZO7fyhstiDTEgXBKueui/wF+0yYNbVUCzRWY+
 yw+Chxqg7Yni1JRv0AciZd32DSZLR1raXrg7ocG6/D/z771337EnxVokJB5TN0QrsiGy93pJG
 Zn0VXc15vYPuWdhVoBx/3rPKV+k4Z1shiq+Ohrwy1uFhzlF9hGEc9MKQjmqchd9mxlyZ+ElSh
 DtJVkRj6pmAyZWIRmnHgoxc3gSXyVgiZe3e5PvqHB2P85RGYRYru6W4c9IZ+B74VJYUlp7KPs
 D1ZxP2yxe7eaE8cQgqs2RFQcOXUiUTcDavHD4CBlK8zGzrL2vC2t0JrsVQHnVbomYdgFHz2CI
 sJux7IAnkLbYUtECa
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> There exists potential resource leaks in the error path, fix them.

I suggest to improve this change description.
How do you think about another wording variant?

   Specific system resources were not released in a few error cases.
   Thus add jump targets for the completion of the desired exception handl=
ing.


=E2=80=A6
+++ b/drivers/irqchip/irq-csky-mpintc.c
@@ -247,8 +247,10 @@ csky_mpintc_init(struct device_node *node, struct dev=
ice_node *parent)
=E2=80=A6
 		INTCG_base =3D ioremap(mfcr("cr<31, 14>"),
 				     INTCL_SIZE*nr_cpu_ids + INTCG_SIZE);

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?id=3D3e08a95294a4fb3702bb3d35ed080284=
33c37fe6#n257


=E2=80=A6
+		if (INTCG_base =3D=3D NULL) {


Would you like to use the following code variant?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sc=
ripts/checkpatch.pl?id=3D3e08a95294a4fb3702bb3d35ed08028433c37fe6#n5756

+		if (!INTCG_base) {


=E2=80=A6
> @@ -270,12 +274,22 @@ csky_mpintc_init(struct device_node *node, struct =
device_node *parent)
>
>  #ifdef CONFIG_SMP
>  	ipi_irq =3D irq_create_mapping(root_domain, IPI_IRQ);
=E2=80=A6
> +	if (!ipi_irq) {
> +		ret =3D -EIO;
> +		goto err_domain_remove;
> +	}
=E2=80=A6

Can the function call =E2=80=9Cirq_domain_remove(root_domain)=E2=80=9D bec=
ome relevant
only if the preprocessor symbol =E2=80=9CCONFIG_SMP=E2=80=9D was defined?

Regards,
Markus
