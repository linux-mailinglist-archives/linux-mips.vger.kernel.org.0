Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7254B68989
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 14:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbfGOMqv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 08:46:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730058AbfGOMqu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Jul 2019 08:46:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45nNZW3J9cz9sNH;
        Mon, 15 Jul 2019 22:46:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1563194807;
        bh=9/SEqZnJa8WoQp6beYVP7szEyuuyjE3Y8ntjl4h2KtE=;
        h=Date:From:To:Cc:Subject:From;
        b=LLFjAfK2CqalVVY8KQGJjBSinznGfUiSl0AuPSDhysPtbyMOH7VJEg7rXy/PMtFok
         /6nPDrPxjA0qU5PKTKaO/ixBTVxTd/Q/1UtHvKFeikvLMitX0q5h1DskvbQAgRdC7f
         U8N2hVoK1mRqx/vwuh0MXs3xIStXJQZQQNyx6NeBNuxzw/55NTQcwuE0SFXeuJ1T84
         APmjuvTLLJHUqux1wq4QMQdqT0XOX4rzMHiRaza3Tn1kQjWIB2Qok7mvvQ3Vl0/sEu
         ewMdWJBb+86pwUO5nEPU0NDQtQ+eQJRnX5iAdIqbgXfI5jsXy5FCTH9dg8hd/i7WLP
         dNrTyrueUm5MQ==
Date:   Mon, 15 Jul 2019 22:46:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Thomas Gleixner <tglx@linutronix.de>,
        John Crispin <john@phrozen.org>,
        Matthias Schiffer <mschiffer@universe-factory.net>,
        "Petr =?UTF-8?B?xaB0ZXRpYXI=?=" <ynezz@true.cz>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] MIPS: fix some more fall through errors in arch/mips
Message-ID: <20190715224640.5e086766@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pMnJdw90F43e.iCCqsGhjyR"; protocol="application/pgp-signature"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--Sig_/pMnJdw90F43e.iCCqsGhjyR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fix these errors:

 arch/mips/cavium-octeon/executive/cvmx-pko.c:489:7: error: this statement =
may fall through [-Werror=3Dimplicit-fallthrough=3D]
 arch/mips/bcm63xx/dev-flash.c:89:3: error: this statement may fall through=
 [-Werror=3Dimplicit-fallthrough=3D]
 arch/mips/ath79/setup.c:155:17: error: this statement may fall through [-W=
error=3Dimplicit-fallthrough=3D]
 arch/mips/ar7/setup.c:50:3: error: this statement may fall through [-Werro=
r=3Dimplicit-fallthrough=3D]

Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: John Crispin <john@phrozen.org>
Cc: Matthias Schiffer <mschiffer@universe-factory.net>
Cc: "Petr =C5=A0tetiar" <ynezz@true.cz>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/mips/ar7/setup.c                        | 1 +
 arch/mips/ath79/setup.c                      | 2 +-
 arch/mips/bcm63xx/dev-flash.c                | 1 +
 arch/mips/cavium-octeon/executive/cvmx-pko.c | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

These are the remaining errors in Linus' tree.

Again, not even tested, but pretty straight forward.

diff --git a/arch/mips/ar7/setup.c b/arch/mips/ar7/setup.c
index ba32825ae58a..b3ffe7c898eb 100644
--- a/arch/mips/ar7/setup.c
+++ b/arch/mips/ar7/setup.c
@@ -57,6 +57,7 @@ const char *get_system_type(void)
 		case TITAN_CHIP_1060:
 			return "TI AR7 (TNETV1060)";
 		}
+		/* fall through */
 	default:
 		return "TI AR7 (unknown)";
 	}
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index f22538cae0ab..ea385a865781 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -153,7 +153,7 @@ static void __init ath79_detect_sys_type(void)
 	case REV_ID_MAJOR_QCA9533_V2:
 		ver =3D 2;
 		ath79_soc_rev =3D 2;
-		/* drop through */
+		/* fall through */
=20
 	case REV_ID_MAJOR_QCA9533:
 		ath79_soc =3D ATH79_SOC_QCA9533;
diff --git a/arch/mips/bcm63xx/dev-flash.c b/arch/mips/bcm63xx/dev-flash.c
index 172dd8397178..a1093934c616 100644
--- a/arch/mips/bcm63xx/dev-flash.c
+++ b/arch/mips/bcm63xx/dev-flash.c
@@ -94,6 +94,7 @@ static int __init bcm63xx_detect_flash_type(void)
 		case STRAPBUS_6368_BOOT_SEL_PARALLEL:
 			return BCM63XX_FLASH_TYPE_PARALLEL;
 		}
+		/* fall through */
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/caviu=
m-octeon/executive/cvmx-pko.c
index 676fab50dd2b..b077597c668a 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-pko.c
@@ -485,11 +485,11 @@ cvmx_pko_status_t cvmx_pko_config_port(uint64_t port,=
 uint64_t base_queue,
 			config.s.qos_mask =3D 0xff;
 			break;
 		case CVMX_PKO_QUEUE_STATIC_PRIORITY:
-			/* Pass 1 will fall through to the error case */
 			if (!cvmx_octeon_is_pass1()) {
 				config.s.qos_mask =3D 0xff;
 				break;
 			}
+			/* fall through - to the error case, when Pass 1 */
 		default:
 			cvmx_dprintf("ERROR: cvmx_pko_config_port: Invalid "
 				     "priority %llu\n",
--=20
2.22.0

--=20
Cheers,
Stephen Rothwell

--Sig_/pMnJdw90F43e.iCCqsGhjyR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0sdbAACgkQAVBC80lX
0GxnxAf/Y/vbLCgdaHACQGiUcRHlAcCMd13g9hqlAh9eU1fluJFLVY8M/QdvSAVw
3Dzmhz02BwkWLf4UiOuL5vid2lq0ABcT04CW+m9DPjk/SZneYnd73F36MQNqvf5E
11tsZbdKBJxte8U4VJhaVp5t4jn0LseZFeXr57e2KWsTaGAMgIEcI1RvJz/LsPyP
x8/gBr6kc6AT5bofCDhRpUJBEF9nQFxfb2wZ3uobq2wvSMNc948vyxlIJffMlzoL
3a8o6qg6AGfJ8TUpNwviDbPvxpcaUdJNwoUMhpWCOCpMI6Gi0kUIt7vUMfNqY0VS
YUmp2jpDjQo8goRClJyFtsuYnjtOBg==
=k1ct
-----END PGP SIGNATURE-----

--Sig_/pMnJdw90F43e.iCCqsGhjyR--
